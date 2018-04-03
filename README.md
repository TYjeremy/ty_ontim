# ty_ontim
just for test

预编译: gcc -E
编译: gcc -S
汇编: gcc -c
链接: gcc

sudo apt-get install vgabios bochs bochs-x bximage

安装bochs
./configure --enable--debugger --enable-disasm
make
sudo make install

创建一个软盘 bximage

把系统写入软盘
dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
