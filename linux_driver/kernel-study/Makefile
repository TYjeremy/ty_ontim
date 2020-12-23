CONFIG_MODULE_SIG=n
app_get := xx_get
app_set := xx_set
obj-m+=xx_hook.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	$(CC) $(app_get).c -o $(app_get)
	$(CC) $(app_set).c -o $(app_set)

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules clean
	rm $(app_get) $(app_set)
