#ifndef __XX_HOOK_H_
#define __XX_HOOK_H_

#define XX_DEV_IOC_MAGIC 'F'

#define XX_DEV_IOC_RESET _IO(XX_DEV_IOC_MAGIC, 0)
#define XX_DEV_IOC_GET _IOR(XX_DEV_IOC_MAGIC, 1, xx_msg_node_t)
#define XX_DEV_IOC_SET _IOW(XX_DEV_IOC_MAGIC, 2, xx_msg_node_t)

#define XX_MSG_SIZE 128
typedef struct xx_msg_node {
	int len;
	char uuid[36];
	char msg[XX_MSG_SIZE];
}xx_msg_node_t;

#endif
