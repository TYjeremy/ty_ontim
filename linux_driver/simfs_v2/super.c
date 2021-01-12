#include <linux/fs.h>
#include <linux/slab.h>
#include "fgfs_kernel.h"

/*
	分配一个新的inode，步骤如下
	1.分配fgfs的inode
	2.获取底层文件系统的sb->alloc_inode调用,通过调用获得lower_inode
	3.关联fgfs inode 和 lower_inode
		通过lower inode的数据初始化fgfs inode
//为什么不需要申请底层的inode
	
*/

struct kmem_cache *fg_inode_info_cache;

struct inode* fg_alloc_inode(struct super_block *sb)
{
//1
	struct fg_inode_info *inode_info = kmem_cache_alloc(fg_inode_info_cache, GFP_KERNEL);
//2
//	struct superblock lower_sb = fg_superblock_to_lower(sb);
//	struct inode* lower_inode = lower_sb->s_op->alloc_inode(lower_sb);

//3
	inode_info->lower_file = NULL;
//	inode_info->wii_inode = lower_inode;

	return &inode_info->vfs_inode;
}

static void fg_destroy_inode(struct inode *inode)
{
	struct fg_inode_info *inode_info = fg_inode_to_private(inode);
	kmem_cache_free(fg_inode_info_cache, inode_info);
}



const struct super_operations fg_sops = {
	.alloc_inode = fg_alloc_inode,
	.destroy_inode = fg_destroy_inode,
};
