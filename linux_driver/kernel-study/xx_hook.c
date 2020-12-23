//hello.c文件
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kallsyms.h>
#include <linux/slab.h>
#include "xx_hook.h"

struct xx_dev *g_xx_devp = NULL;
struct list_head g_xx_list;
struct class *xx_class = NULL;
DECLARE_WAIT_QUEUE_HEAD(g_xx_wait_msg);
#if XX_OPEN_ONECE
static atomic_t xx_avalible = ATOMIC_INIT(1);
#endif
  

static int  xx_open (struct inode *inodep, struct file *filp)
{
	struct xx_dev* xx_devp;

#if XX_OPEN_ONECE
	if(! atomic_dec_and_test(&xx_avalible)) {
		atomic_inc(&xx_avalible);
		return -EBUSY;
	}
#endif

	xx_devp = (struct xx_dev*)container_of(inodep->i_cdev, struct xx_dev, cdev);
	filp->private_data = xx_devp;
	return 0;
}


static inline void show_msg(xx_ctrl_node_t node)
{
	printk("%s:%d uuid=%s, msg = %s\n",
		__func__, __LINE__, node.msg_node.uuid, node.msg_node.msg);
}


static int xx_release (struct inode *inodep, struct file *filp)
{
	struct xx_dev* xx_devp = filp->private_data;

	xx_ctrl_node_t* node;
	struct list_head* pos1;
	struct list_head* pos2;

#if XX_OPEN_ONECE
	atomic_inc(&xx_avalible);
#endif

	spin_lock(&xx_devp->xx_msg_lock);
	list_for_each_safe(pos1, pos2, &g_xx_list) {
		node = list_entry(pos1, xx_ctrl_node_t, list);
		show_msg(*node);
//		list_del(pos1);
//		kfree(node);
	}
	spin_unlock(&xx_devp->xx_msg_lock);

	return 0;
}

static ssize_t xx_read (struct file *filp, char __user *buff, size_t count, loff_t *offset)
{
	struct xx_dev* xx_devp = filp->private_data;
	xx_ctrl_node_t* node;
	struct list_head* pos1;
	struct list_head* pos2;

	spin_lock(&xx_devp->xx_msg_lock);
	list_for_each_safe(pos1, pos2, &g_xx_list) {
		node = list_entry(pos1, xx_ctrl_node_t, list);
		show_msg(*node);
		list_del(pos1);
		kfree(node);
	}
	spin_unlock(&xx_devp->xx_msg_lock);
	return count;
}
static ssize_t xx_write (struct file *filp, const char __user *buf, size_t count, loff_t *offst)
{
	char *p = "1234";
	struct xx_dev* xx_devp = filp->private_data;
	xx_ctrl_node_t*  xx_new_nodep;
	xx_new_nodep = kzalloc(sizeof(xx_ctrl_node_t), GFP_KERNEL);
	if(!xx_new_nodep) goto fail;

	strncpy(xx_new_nodep->msg_node.uuid, p, strlen(p));
	strncpy(xx_new_nodep->msg_node.msg, p, strlen(p));
	
	
	spin_lock(&xx_devp->xx_msg_lock);
	list_add(&xx_new_nodep->list, &g_xx_list);
	spin_unlock(&xx_devp->xx_msg_lock);
	return count;

fail:
	return -1;
}


long xx_ioctl (struct file *filp, unsigned int cmd, unsigned long arg)
{
	int ret = -1, i = 0;
	xx_ctrl_node_t *tmp_nodep = NULL, *tmp_nodep2 = NULL;
	struct list_head *pos1 = NULL, *pos2 = NULL;

	struct xx_dev* xx_devp = filp->private_data;
	
	switch(cmd) {
		case XX_DEV_IOC_RESET:
			break;
		case XX_DEV_IOC_GET: //just for fun, get one node
			printk("list_empty(g_xx_list) = %d\n", list_empty(&g_xx_list));
			wait_event_interruptible(g_xx_wait_msg, list_empty(&g_xx_list) == 0);
			printk("%s:%d cmd = XX_DEV_IOC_GET", __func__, __LINE__);
			tmp_nodep2 = kzalloc(sizeof(xx_ctrl_node_t), GFP_KERNEL);
			if(tmp_nodep2 != NULL) {
				if(0 != copy_from_user(&tmp_nodep2->msg_node, 
						(xx_msg_node_t*)arg, sizeof(xx_msg_node_t))) {
					printk(KERN_ERR"%s:%d copy_from user error\n", __func__, __LINE__);
					return -EFAULT;
				}

				spin_lock(&xx_devp->xx_msg_lock);
				list_for_each_safe(pos1, pos2, &g_xx_list) {
					tmp_nodep = list_entry(pos1, xx_ctrl_node_t, list);
					if(strcmp(tmp_nodep2->msg_node.uuid, tmp_nodep->msg_node.uuid) == 0) {
						show_msg(*tmp_nodep);
						if(0 != copy_to_user((xx_msg_node_t*)arg, 
								&tmp_nodep->msg_node,sizeof(xx_msg_node_t))) {
							spin_unlock(&xx_devp->xx_msg_lock);
							printk(KERN_ERR"%s:%d copy_to_user error\n", __func__, __LINE__);
							kfree(tmp_nodep2);
							return -EFAULT;
						}
						list_del(pos1);
						kfree(tmp_nodep2);
						kfree(tmp_nodep);
						ret = 0;
						break;
					}
				}
				spin_unlock(&xx_devp->xx_msg_lock);
			}
			break;
		case XX_DEV_IOC_SET:
			printk("%s:%d cmd = XX_DEV_IOC_SET", __func__, __LINE__);
			tmp_nodep = kzalloc(sizeof(xx_ctrl_node_t), GFP_KERNEL);
			if(tmp_nodep != NULL) {
				if(0 != copy_from_user(&tmp_nodep->msg_node, 
						(xx_msg_node_t*)arg, sizeof(xx_msg_node_t))) {
					kfree(tmp_nodep);
					printk(KERN_ERR"%s:%d copy_from user error\n", __func__, __LINE__);
					return -EFAULT;
				}
				show_msg(*tmp_nodep);

				while(tmp_nodep->msg_node.msg[i] != '\0' && i < XX_MSG_SIZE)
						tmp_nodep->msg_node.msg[i++] ^= 0x55;
				printk("%s:%d cmd = XX_DEV_IOC_SET", __func__, __LINE__);
				spin_lock(&xx_devp->xx_msg_lock);
				printk("%s:%d cmd = XX_DEV_IOC_SET", __func__, __LINE__);
				list_add(&tmp_nodep->list, &g_xx_list);
				wake_up_interruptible(&g_xx_wait_msg);
				printk("%s:%d cmd = XX_DEV_IOC_SET", __func__, __LINE__);
				spin_unlock(&xx_devp->xx_msg_lock);
				ret = 0;
			}
			break;

		default:
			return -EINVAL;
	}

	return -EINVAL;
}

struct file_operations xx_ops = {
	.owner = THIS_MODULE,
	.open = xx_open,
	.release = xx_release,
	.read = xx_read,
	.write = xx_write,
	.unlocked_ioctl = xx_ioctl,
};

static int xx_chrdev_init(struct xx_dev* xx_devp)
{
	int ret = -1;

	ret = down_interruptible(&xx_devp->sem);
	if(0 != ret) return ret;
	if(!xx_devp) goto fail;

	if(XX_HOOK_MAJOR) {
		xx_devp->devno = MKDEV(XX_HOOK_MAJOR, XX_HOOK_MINOR);

		ret = register_chrdev_region(xx_devp->devno, 1, XX_HOOK_NAME);
		if(ret) {
			ret = alloc_chrdev_region(&xx_devp->devno, 0, 1, XX_HOOK_NAME);
			if(ret) goto fail;
		}
		
	}

	printk("%s:%d begin devno = %x\n", __func__, __LINE__, xx_devp->devno);
	cdev_init(&xx_devp->cdev, &xx_ops);
	xx_devp->cdev.owner = THIS_MODULE;
	ret = cdev_add(&xx_devp->cdev, xx_devp->devno, 1);
	if(ret) goto cdev_fail;

	xx_class = class_create(THIS_MODULE, XX_HOOK_CLASS_NAME);
	if(!xx_class) goto class_fail;

	device_create(xx_class, NULL, xx_devp->devno, NULL, XX_HOOK_NAME);
	up(&xx_devp->sem);
	return ret;

class_fail:
	cdev_del(&xx_devp->cdev);
cdev_fail:
	unregister_chrdev_region(xx_devp->devno, 1);
fail:
	return ret;;
}

void xx_chrdev_rinit(struct xx_dev* xx_devp)
{
	if(!xx_devp) return;

	cdev_del(&xx_devp->cdev);
	unregister_chrdev_region(xx_devp->devno, 1);
}

static int init_hello_module(void)
{
	int ret = -1;
	printk("Hello World Enter \n");
	g_xx_devp = kzalloc(sizeof(struct xx_dev), GFP_KERNEL);
	if(!g_xx_devp)	goto fail;

	INIT_LIST_HEAD(&g_xx_list);
	spin_lock_init(&g_xx_devp->xx_msg_lock);
	sema_init(&g_xx_devp->sem, 1);
	ret = xx_chrdev_init(g_xx_devp);

fail:
	return ret;
}


static void exit_hello_module(void)
{
	printk("Hello World Exit! \n");
	device_destroy(xx_class, g_xx_devp->devno);
	class_destroy(xx_class);
	if(g_xx_devp)
		xx_chrdev_rinit(g_xx_devp);
	kfree(g_xx_devp);
}

module_init(init_hello_module);
module_exit(exit_hello_module);

MODULE_LICENSE("GPL");//一般放到最后
MODULE_AUTHOR("FAN");
