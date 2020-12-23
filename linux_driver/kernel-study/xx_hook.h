#ifndef __XX_HOOK_H_
#define __XX_HOOK_H_
#include <linux/cdev.h>
#include <linux/types.h>
#include <linux/semaphore.h>
#include <asm/ioctl.h>

#define XX_OPEN_ONECE 0

#define XX_HOOK_NAME "xxhook"
#define XX_HOOK_CLASS_NAME "xxhook-dev"
#define XX_HOOK_MAJOR 250
#define XX_HOOK_MINOR 0


#define XX_DEV_IOC_MAGIC 'F'

#define XX_DEV_IOC_RESET _IO(XX_DEV_IOC_MAGIC, 0)
#define XX_DEV_IOC_GET _IOR(XX_DEV_IOC_MAGIC, 1, struct xx_msg_node)
#define XX_DEV_IOC_SET _IOW(XX_DEV_IOC_MAGIC, 2, struct xx_msg_node)

struct xx_dev {
	struct cdev cdev;
	spinlock_t xx_msg_lock;
	dev_t devno;
	struct semaphore sem;
};

#define XX_MSG_SIZE 128
typedef struct xx_msg_node {
	int len;
	char uuid[36];
	char msg[XX_MSG_SIZE];
}xx_msg_node_t;

typedef struct {
	struct xx_msg_node msg_node;
	struct list_head list;
}xx_ctrl_node_t;

#endif
