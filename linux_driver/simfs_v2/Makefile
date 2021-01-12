ARCH:=arm64
CROSS_COMPILE:=aarch64-linux-gnu-

obj-m +=  fgfs.o
fgfs-objs :=  main.o inode.o super.o file.o

KERNELDIR := /home/jeremy/study/linux/linux-4.19.71/
PWD := $(shell pwd) 

modules: 
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules 
	cp fgfs.ko ../../busybox/rootfs/

clean:
	make -C $(KERNELDIR) M=$(PWD) modules clean
