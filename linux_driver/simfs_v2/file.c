#include <linux/cred.h>
#include <linux/fs_stack.h>
#include "fgfs_kernel.h"

struct fg_getdents_callback {
	struct dir_context ctx;
	struct dir_context *caller;
	struct super_block *sb;
	int filldir_called;
	int entries_written;
};

static int fg_filldir(struct dir_context *ctx, const char *lower_name,
					int lower_namelen, loff_t offset, u64 ino, unsigned int d_type)
{
	struct fg_getdents_callback *buf = 
			container_of(ctx, struct fg_getdents_callback, ctx);

	int rc;

	buf->filldir_called++;

	buf->caller->pos = buf->ctx.pos;
	rc = !dir_emit(buf->caller, lower_name, lower_namelen, ino, d_type);
printk("%s:%d name = %s rc = %d pos = %lld\n",
			__func__, __LINE__, lower_name, rc, buf->caller->pos);

	return rc;
}

static int fg_readdir(struct file *file, struct dir_context *ctx)
{
	int rc;
	struct file *lower_file;
	struct inode *inode = file_inode(file);

	struct fg_getdents_callback buf = {
		.ctx.actor = fg_filldir,
		.ctx.pos = 0,
		.caller = ctx,
		.sb = inode->i_sb,
	};

	lower_file = fg_file_to_lower(file);

	rc = iterate_dir(lower_file, &buf.ctx);

	ctx->pos = buf.ctx.pos;

	if(rc >= 0)
		fsstack_copy_attr_atime(inode, file_inode(lower_file));
		

printk("%s:%d lower_file = %px\n", __func__, __LINE__, lower_file);

	return 0;
}

struct kmem_cache *fg_file_info_cache;
static int fg_dir_open(struct inode *inode, struct file *file)
{
	struct dentry *fg_dentry = file->f_path.dentry;

	struct fg_file_info *file_info;
	struct file *lower_file;

	file_info = kmem_cache_zalloc(fg_file_info_cache, GFP_KERNEL);
	fg_set_file_private(file, file_info);


	lower_file = dentry_open(fg_dentry_to_lower_path(fg_dentry), 
							file->f_flags, current_cred());

	fg_set_file_lower(file, lower_file);
printk("%s:%d lower_file = %px\n", __func__, __LINE__, lower_file);

	return 0;
}

/*
* fg_open
* 
* inode 查找文件的inode
* file 查找文件的file,里面有path
*/
static int fg_open(struct inode *inode, struct file *file)
{
	struct file* lower_file;
	struct fg_file_info* file_info;
	struct dentry *fg_dentry = file->f_path.dentry;
	lower_file = dentry_open(fg_dentry_to_lower_path(fg_dentry),
						file->f_flags, current_cred());
	printk("%s:%d lower_file = %px, lower_file->f_inode->i_sb->s_type->name = %s\n",
			__func__, __LINE__, lower_file, lower_file->f_inode->i_sb->s_type->name);

	file_info = kmem_cache_zalloc(fg_file_info_cache, GFP_KERNEL);

	fg_set_file_private(file, file_info);
	fg_set_file_lower(file, lower_file);
	fg_set_inode_file_lower(inode, lower_file);

	return 0;
}

static ssize_t fg_read_update_atime(struct kiocb *iocb,
								struct iov_iter *to)
{
	ssize_t rc;
	struct path *path;
	struct file *file = iocb->ki_filp;

	rc = generic_file_read_iter(iocb, to);

	if(rc >= 0) {
		path = fg_dentry_to_lower_path(file->f_path.dentry);
		touch_atime(path);
	}

	return rc;
}


const struct file_operations fg_dir_fops = {
	.owner = THIS_MODULE,
	.iterate_shared = fg_readdir,
	.open = fg_dir_open,
};

const struct file_operations fg_main_fops = {
	.owner = THIS_MODULE,
	.open = fg_open,
	.read_iter = fg_read_update_atime,
};
