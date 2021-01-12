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
//	inode->i_mapping->a_ops = lower_inode->i_mapping->a_ops;

	//
	if(S_ISDIR(inode->i_mode)) {
		inode->i_op = &fg_dir_iops;
		inode->i_fop = &fg_dir_fops;
	} else {
		inode->i_op = lower_inode->i_op;
		inode->i_fop = lower_inode->i_fop;
	}


	return 0;
}

struct inode* fg_get_inode(struct inode* lower_inode, struct super_block* sb)
{
	struct inode *inode;

	inode = iget5_locked(sb, (unsigned long)lower_inode, 
					fg_inode_test, fg_inode_set, lower_inode);
	printk("%s:%d inode = %px\n", inode);
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
	char* name = child_dentry->d_name.name;
	ssize_t len = child_dentry->d_name.len;
	printk("%s:%d fg_dir_inode = %px\n", __func__, __LINE__, fg_dir_inode);
	printk("%s:%d fg_dir_root_dentry = %px\n", __func__, __LINE__, child_dentry->d_parent);

	lower_dir_dentry = fg_dentry_to_lower(child_dentry->d_parent);

	lower_dentry = lookup_one_len_unlocked(name, lower_dir_dentry, len); //调用底层lookup

	res = fg_lookup_interpose(child_dentry, lower_dentry);

	return res;
}

const struct inode_operations fg_dir_iops = {
	.lookup = fg_lookup,
};



























