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


const struct file_operations fg_dir_fops = {
	.owner = THIS_MODULE,
	.iterate_shared = fg_readdir,
	.open = fg_dir_open,
};
