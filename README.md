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

寄存器:

cs是代码段寄存器

ds是数据段寄存器

ss是堆栈段寄存器

es是扩展段寄存器

fs是标志段寄存器

gs是全局段寄存器

sp是堆栈指针寄存器

lgdt: 加载全局描述符
92h: A20
cr0:控制实模式和保护模式

lodsb: 具体操作是把SI指向的存储单元读入累加器
