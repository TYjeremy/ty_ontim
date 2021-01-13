#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/file.h>
#include <linux/namei.h>
#include <linux/export.h>
#include <linux/fs_stack.h>
#include "fgfs_kernel.h"

static int fg_inode_test(struct inode *inode, void* lower_inode)
{
	return fg_inode_to_lower(inode) == lower_inode;
}

static int fg_inode_set(struct inode *inode, void* opaque)
{
	struct inode* lower_inode = opaque;

	fg_set_inode_lower(inode, lower_inode);
	fsstack_copy_attr_all(inode, lower_inode);

	fsstack_copy_inode_size(inode, lower_inode);
	inode->i_ino = lower_inode->i_ino;
	inode->i_mapping->a_ops = &fg_aops;

	//
	if(S_ISDIR(inode->i_mode)) {
		inode->i_op = &fg_dir_iops;
		inode->i_fop = &fg_dir_fops;
	} else {
		inode->i_op = &fg_file_iops;
		inode->i_fop = &fg_main_fops;
	}


	return 0;
}

struct inode* fg_get_inode(struct inode* lower_inode, struct super_block* sb)
{
	struct inode *inode;

	inode = iget5_locked(sb, (unsigned long)lower_inode, 
					fg_inode_test, fg_inode_set, lower_inode);

	return inode;
}

struct dentry* fg_lookup_interpose(struct dentry* dentry, struct dentry* lower_dentry)
{
	struct inode *inode, *lower_inode = d_inode(lower_dentry);
	struct fg_dentry_info *dentry_info;
	struct vfsmount *lower_mnt;

	dentry_info = kmem_cache_zalloc(fg_dentry_info_cache, GFP_KERNEL);

	lower_mnt = mntget(fg_dentry_to_lower_mnt(dentry->d_parent));
	fsstack_copy_attr_atime(d_inode(dentry->d_parent), 
							d_inode(lower_dentry->d_parent));

	fg_set_dentry_private(dentry, dentry_info);
	dentry_info->lower_path.mnt = lower_mnt;
	dentry_info->lower_path.dentry = lower_dentry;

    if (d_really_is_negative(lower_dentry)) {
        d_add(dentry, NULL);
        return NULL;
    }

	inode = fg_get_inode(lower_inode, dentry->d_sb);

	if(inode->i_state & I_NEW)
		unlock_new_inode(inode);

	return d_splice_alias(inode, dentry);
}

/*
* fg_lookup
* @fg_dir_inode  父目录inode
* @child_dentry     子dentry 未与inode关联
*	
*
* 1. 首先通过子目录找到父目录的底层目录节点
* 2. 通过子目录名字在上一步的结果中查找
* 3. 找到后，使用lower_dentry对child_dentry进行初始化
*/
static struct dentry* fg_lookup(struct inode *fg_dir_inode,
					struct dentry *child_dentry, unsigned int flags)
{
	struct dentry *res, *lower_dir_dentry, *lower_dentry;
	const char* name = child_dentry->d_name.name;
	ssize_t len = child_dentry->d_name.len;
	printk("%s:%d fg_dir_inode = %px\n", __func__, __LINE__, fg_dir_inode);
	printk("%s:%d fg_dir_root_dentry = %px\n", __func__, __LINE__, child_dentry->d_parent);

	lower_dir_dentry = fg_dentry_to_lower(child_dentry->d_parent);
	//d_inode(lower_dir_dentry)->i_flags &= ~S_DEAD; 挂载proc不能mkdir，实际为proc未提供mkdir功能

	lower_dentry = lookup_one_len_unlocked(name, lower_dir_dentry, len); //调用底层lookup

	if(IS_ERR(lower_dentry)) {
		res = ERR_CAST(lower_dentry);
		return res;
	} else {
		res = fg_lookup_interpose(child_dentry, lower_dentry);
	}

	return res;
}
static int fg_interpose(struct dentry* lower_dentry, struct dentry* child_dentry,
						struct super_block* sb)
{
	struct inode *inode = fg_get_inode(d_inode(lower_dentry), sb);
	d_instantiate(child_dentry, inode);
	return 0;
}

static struct dentry *lock_parent(struct dentry* dentry)
{
	struct dentry *dir;
	dir = dget_parent(dentry);
	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
	return dir;
}

static void unlock_dir(struct dentry *dir)
{
	inode_unlock(d_inode(dir));
	dput(dir);
}

/*
* fg_mkdir
* dir 被创建文件的目录inode
* dentry 新文件dentry
* mode 创建文件的mode
*/
static int fg_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
{
	struct dentry *lower_dentry;
	struct dentry *lower_dir_dentry;
	int rc;

	lower_dentry = fg_dentry_to_lower(dentry);
	lower_dir_dentry = lock_parent(lower_dentry); //会给上层目录inode上锁，不允许其他进程访问该目录 

	rc = vfs_mkdir(d_inode(lower_dir_dentry), lower_dentry, mode);
	if(rc || d_really_is_negative(lower_dentry))
		goto out;

	rc = fg_interpose(lower_dentry, dentry, dir->i_sb);
	if(rc)
		goto out;

	fsstack_copy_attr_times(dir, d_inode(lower_dir_dentry));
	fsstack_copy_inode_size(dir, d_inode(lower_dir_dentry));
	unlock_dir(lower_dir_dentry); //忘记解锁时，ls时会停留在iterate_dir

out:
	return rc;
}

struct inode* fg_do_create(struct inode* dir_inode, struct dentry* child_dentry, umode_t mode)
{
	return NULL;
}

/*
* fg_create 创造新节点
* dir_inode 父inode节点
* child_dentry 新孩子dentry
* //未实现
*/
static int fg_create(struct inode* dir_inode, struct dentry* child_dentry, umode_t mode, bool excl)
{
	return 0;
}

const struct inode_operations fg_dir_iops = {
	.create = fg_create,
	.lookup = fg_lookup,
	.mkdir = fg_mkdir,
//	.mknod = fg_mknod,
};

static int fg_permission(struct inode *inode, int mask)
{
	return inode_permission(fg_inode_to_lower(inode), mask);
}

const struct inode_operations fg_file_iops = {
	.permission = fg_permission,
};
