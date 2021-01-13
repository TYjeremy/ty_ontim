#include <linux/fs.h>
#include <linux/page-flags.h>
#include <linux/pagemap.h>
#include <linux/sched/signal.h>
#include "fgfs_kernel.h"


static int fg_read_lower_page_segment(struct page* page_for_fg,
								pgoff_t page_index,
								size_t offset_in_page, ssize_t size,
								struct inode *fg_inode)
{
	char *virt;
	loff_t offset;
	struct file *lower_file;
	int rc;

	offset = ((((loff_t)page_index) << PAGE_SHIFT) + offset_in_page);
	virt = kmap(page_for_fg);

	lower_file = fg_inode_to_private(fg_inode)->lower_file;

	rc = kernel_read(lower_file, virt, size, &offset);
	if(rc >0) rc = 0;

	kunmap(page_for_fg);
	flush_dcache_page(page_for_fg);

	return rc;
}

static int fg_readpage(struct file *file, struct page *page)
{
	int rc = 0;
	char* virt;

	rc = fg_read_lower_page_segment(page, page->index, 0,
								PAGE_SIZE, page->mapping->host);
	SetPageUptodate(page); //读取成功必须update一下page，不然会一直等待page更新
	unlock_page(page);
	virt = kmap(page);
	printk("%s:%d virt = %s\n", __func__, __LINE__, virt);

	kunmap(page);

	return rc;
}

const struct address_space_operations fg_aops = {
	.readpage = fg_readpage,
};
