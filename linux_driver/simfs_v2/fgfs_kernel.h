#ifndef __ZF_FS_H_
#define __ZF_FS_H_
#include <linux/fs.h>
#include <linux/slab.h>

#define ZFFS_SUPER_BLOCK_MAGIC 0xf15e

extern struct kmem_cache *fg_file_info_cache;
extern struct kmem_cache *fg_inode_info_cache;
extern struct kmem_cache *fg_dentry_info_cache;
extern const struct super_operations fg_sops;
extern const struct inode_operations fg_dir_iops;
extern const struct file_operations fg_dir_fops;

struct fg_sb_info {
	struct super_block *wsi_sb;
};

struct fg_inode_info {
	struct inode vfs_inode;
	struct inode *wii_inode;
	struct file *lower_file;
};

struct fg_dentry_info {
	struct path lower_path;
};

struct fg_file_info{
	struct file *wfi_file;
};


struct inode* fg_get_inode(struct inode *, struct super_block*);
extern struct inode *iget5_locked(struct super_block *sb, unsigned long hashval,
        int (*test)(struct inode *, void *),
        int (*set)(struct inode *, void *), void *data);
extern struct vfsmount *mntget(struct vfsmount *mnt);

static inline void fg_set_superblock_private(struct super_block *sb, struct fg_sb_info *sb_info)
{
	sb->s_fs_info = sb_info;
}

static inline struct super_block* fg_superblock_to_lower(struct super_block* sb)
{
	return ((struct fg_sb_info*)sb->s_fs_info)->wsi_sb;
}

static inline void fg_set_superblock_lower(struct super_block *sb,
							struct super_block *lower_sb) {
		((struct fg_sb_info*)(sb->s_fs_info))->wsi_sb = lower_sb;
}

static inline struct path *fg_dentry_to_lower_path(struct dentry *dentry)
{
	return &((struct fg_dentry_info*)dentry->d_fsdata)->lower_path;
}

static inline void fg_set_dentry_private(struct dentry *dentry,
									struct fg_dentry_info *dentry_info)
{
	dentry->d_fsdata = dentry_info;
}

static inline struct dentry * fg_dentry_to_lower(struct dentry *dentry)
{
	return ((struct fg_dentry_info *) dentry->d_fsdata)->lower_path.dentry;
}

static inline struct fg_inode_info *fg_inode_to_private(struct inode* inode)
{
	return container_of(inode, struct fg_inode_info, vfs_inode);
}

static inline struct inode* fg_inode_to_lower(struct inode *inode)
{
	return fg_inode_to_private(inode)->wii_inode;
}

static inline void fg_set_inode_lower(struct inode *inode, struct inode *lower_inode)
{
	fg_inode_to_private(inode)->wii_inode = lower_inode;
}

static inline void fg_set_file_lower(struct file *file, struct file *lower_file)
{
	((struct fg_file_info *)file->private_data)->wfi_file = lower_file;
}

static inline struct file* fg_file_to_lower(struct file *file)
{
	return ((struct fg_file_info*)file->private_data)->wfi_file;
}

static inline void fg_set_file_private(struct file *file, struct fg_file_info *file_info)
{
	file->private_data = file_info;
}

static inline struct vfsmount* fg_dentry_to_lower_mnt(struct dentry *dentry)
{
	return ((struct fg_dentry_info*) dentry->d_fsdata)->lower_path.mnt;
}



#endif
