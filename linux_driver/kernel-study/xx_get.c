#include <stdio.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "xx_main.h"


int main(void)
{
	int ret = -1;
	int i = 0, idx = 0;
	int rand_data;

	xx_msg_node_t xx_msg;
	memset(&xx_msg, 0, sizeof(xx_msg_node_t));
	int fd = open("/dev/xxhook", O_RDONLY);

	if(fd < 0) return ret;

	for(i = 0; i < 100; i ++) {
		sleep(1);
		sprintf((char *)&xx_msg.uuid, "%x", i);

		ioctl(fd, XX_DEV_IOC_GET, &xx_msg);
		for(idx = 0; xx_msg.msg[idx] != '\0' && idx < XX_MSG_SIZE; idx ++) {
			xx_msg.msg[idx] ^= 0x55;
		}
		printf("src uuid = %s msg = %s\n", xx_msg.uuid, xx_msg.msg);
		memset(xx_msg.msg, '\0', 128);
	}

	close(fd);

	return 0;
}

