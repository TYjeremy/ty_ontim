#include <linux/init.h>
#include <linux/module.h>
#include <linux/kallsyms.h> 
#include <linux/unistd.h>
#include <linux/sched.h>
#include <linux/syscalls.h>
#include <linux/string.h>
#include <linux/fs.h>
#include <linux/fdtable.h>
#include <linux/uaccess.h> 
#include <linux/rtc.h>
#include <linux/slab.h>
#include <linux/namei.h>
#include "fgfs_kernel.h"

MODULE_LICENSE("GPL");

struct kmem_cache *fg_sb_info_cache;
struct kmem_cache *fg_dentry_info_cache;


/**
 * inode_info_init_once
 *
 * Initializes the ecryptfs_inode_info_cache when it is created
 */
static void
inode_info_init_once(void *vptr)
{
    struct fg_inode_info *ei = (struct fg_inode_info *)vptr;

    inode_init_once(&ei->vfs_inode);
}

static struct fg_cache_info {
	struct kmem_cache **cache;
	const char *name;
	size_t size;
	slab_flags_t flags;
	void (*ctor)(void *obj);
} fg_cache_infos[] = {
	{
		.cache = &fg_sb_info_cache,
		.name = "fg_sb_cache",
		.size = sizeof(struct fg_sb_info),
	},
	{
		.cache = &fg_dentry_info_cache,
		.name = "fg_dentry_info_cache",
		.size = sizeof(struct fg_dentry_info),
	},
	{
		.cache = &fg_inode_info_cache,
		.name = "fg_inode_info_cache",
		.size = sizeof(struct fg_inode_info),
		.flags = SLAB_ACCOUNT,
		.ctor = inode_info_init_once, //inode申请时必须初始化，里面各种链表，不初始化，运行时会出乱七八糟的指针问题
	},
	{
		.cache = &fg_file_info_cache,
		.name = "&fg_file_info_cache",
		.size = sizeof(struct fg_file_info),
	}
};

static int fg_init_kmem_caches(void)
{
	int i;
	for(i = 0; i < ARRAY_SIZE(fg_cache_infos); i ++) {
		struct fg_cache_info *info;
		info = &fg_cache_infos[i];
		*(info->cache) = kmem_cache_create(info->name, info->size, 0,
				SLAB_HWCACHE_ALIGN | info->flags, info->ctor);

		if(!*(info->cache)) {
			printk("%s:%d kmem_cache_create failed info->name = %s\n", __func__, __LINE__, info->name);
			return -ENOMEM;
		}
	}

	return 0;
}


/*
	1. 设置底层super block
	2. 设置底层root dentry
*/
static struct dentry *fg_mount(struct file_system_type *fs_type,
    int flags, const char *dev_name, void *data)
{
	struct super_block *s = NULL;
	struct fg_sb_info * sbi = NULL;
	struct fg_dentry_info *root_info = NULL;
	struct inode *inode = NULL;
	struct path path;
	int rc;
	
	fg_init_kmem_caches();
	printk("%s:%d sbi = %px\n", __func__, __LINE__, sbi);
	sbi = kmem_cache_zalloc(fg_sb_info_cache, GFP_KERNEL);

	if(!sbi) {
		rc = -ENOMEM;
		printk("%s:%d sbi = %px\n", __func__, __LINE__, sbi);
		goto out;
	} else {
		printk("%s:%d sbi = %px\n", __func__, __LINE__, sbi);
	}

	s = sget(fs_type, NULL, set_anon_super, flags, NULL);
	if(IS_ERR(s)) {
		rc = PTR_ERR(s);
		printk("%s:%d sb = %px\n", __func__, __LINE__, s);
		goto out;
	}

	fg_set_superblock_private(s, sbi);

	sbi = NULL;
	s->s_op = &fg_sops;
//	s->s_d_ops = &fg_dops;
	
	rc = kern_path(dev_name, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path); //获取lower path

	printk(" lower_filesystem = %s", path.dentry->d_sb->s_type->name);

	fg_set_superblock_lower(s, path.dentry->d_sb); //设置底层superblock

/*
	s->s_flags = flags & ~SB_POSIXACL;
	s->s_flags |= path.dentry->d_sb->s_flags & SB_POSIXACL;

	if(sb_rdonly(path.dentry->d_sb))
		s->s_flags |= SB_RDONLY;
*/

	s->s_maxbytes = path.dentry->d_sb->s_maxbytes;
	s->s_blocksize = path.dentry->d_sb->s_blocksize;
	s->s_magic = ZFFS_SUPER_BLOCK_MAGIC;
	s->s_stack_depth = path.dentry->d_sb->s_stack_depth +1;
	printk("%s:%d maxbytes = %lld, blocksize = %ld, stack_depth = %d\n",
				__func__, __LINE__, s->s_maxbytes, s->s_blocksize, s->s_stack_depth);
//以上super block设置完毕


//获取root dentry,需要知道相应的inode，我们inode为下层挂载点的inode
	inode = fg_get_inode(d_inode(path.dentry), s);
printk("%s:%d inode = %px prev = %px, next = %px\n", __func__, __LINE__, inode, inode->i_io_list.prev, inode->i_io_list.next);
	printk("fg_get_inode for root_inode = %px\n", inode);


	s->s_root = d_make_root(inode); //inode和s_root联系起来


	if(!s->s_root) {
		rc = -ENOMEM;
		goto out;
	}

	root_info = kmem_cache_zalloc(fg_dentry_info_cache, GFP_KERNEL);
	if(!root_info)
		goto out;

	fg_set_dentry_private(s->s_root, root_info);
	root_info->lower_path = path;

	s->s_flags |= SB_ACTIVE;
	printk("fg_get_inode for super_block = %px root_dentry = %px lower_dentry = %px\n", s, dget(s->s_root), root_info->lower_path.dentry);
printk("%s:%d inode = %px prev = %px, next = %px\n", __func__, __LINE__, inode, inode->i_io_list.prev, inode->i_io_list.next);
	return dget(s->s_root);
	

out:
	return NULL;
}

static struct file_system_type fgfs_type = {
	.owner = THIS_MODULE,
    .name       = "fgfs",
    .mount      = fg_mount,
    .kill_sb    = kill_litter_super,
};

int fg_init(void) {

	int err = register_filesystem(&fgfs_type);
	
	if (err)
	    unregister_filesystem(&fgfs_type);
	
	return err;
}

static void fg_exit(void) { 

	printk("+ Unloading simple fs module\n"); 
} 

module_init(fg_init); 
module_exit(fg_exit);
