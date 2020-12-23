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
	int i = 0;
	int rand_data;

	xx_msg_node_t xx_msg;
	memset(&xx_msg, 0, sizeof(xx_msg_node_t));
	int fd = open("/dev/xxhook", O_WRONLY);

	if(fd < 0) return ret;

	srand(time(0));
	for(i = 0; i < 100; i ++) {
		sleep(1);
		rand_data =  rand();
		sprintf((char*)&xx_msg.uuid, "%x", i);
		sprintf((char*)&xx_msg.msg, "%x", rand_data);
		printf("src uuid = %s msg = %s\n", xx_msg.uuid, xx_msg.msg);
			
		ioctl(fd, XX_DEV_IOC_SET, &xx_msg);
		ioctl(fd, XX_DEV_IOC_SET, &xx_msg);
	}

	close(fd);

	return 0;
}

