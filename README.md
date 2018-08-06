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


TOP Level ModeMultiplexer in short TLMM


add OF、SF、ZF、AF、CF 和 PF 的状态依计算结果而定。

and OF=0,CF=0;对 SF、ZF 和 PF 的影响依计算结果而定。

cbw 不影响任何标志位。

cld DF=0,CF、OF、ZF、SF、AF 和 PF 未定义。未定义的意思是到目前为止还不
打算让该指令影响到这些标志,因此,不要在程序中依赖这些标志。
 
cwd 不影响任何标志位。

dec CF 标志不受影响,因为该指令通常在程序中用于循环计数,而且在循环体内通第 6 章
相同的功能,不同的代码
常有依赖 CF 标志的指令,故不希望它打扰 CF 标志;对 OF、SF、ZF、AF 和

PF 的影响依计算结果而定。

div/idiv 对 CF、OF、SF、ZF、AF 和 PF 的影响未定义。

inc CF 标志不受影响,对 OF、SF、ZF、AF 和 PF 的影响依计算结果而定。

mov/movs 这类指令不影响任何标志位。

neg 如果操作数为 0,则 CF=0,否则 CF=1;对 OF、SF、ZF、AF 和 PF 的影响依计
算结果而定。

std DF=1,不影响其他标志位。

sub 对 OF、SF、ZF、AF、PF 和 CF 的影响依计算结果而定。

xor OF=0,CF=0;对 SF、ZF 和 PF 依计算结果而定;对 AF 的影响未定义。


CF是进位标志
PF是奇偶标志
AF是辅助进位标志
ZF是零标志
SF是符号标志
OF是溢出标志

8 个通用寄存器 AX、BX、CX、DX、SI、DI、BP 和 SP
