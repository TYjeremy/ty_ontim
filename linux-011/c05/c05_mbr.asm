SYSSIZE equ 0x3000

SETUPLEN equ  4
BOOTSEG equ 0x07c0
INITSEG equ 0x9000
SETUPSEG equ 0x9020
SYSSEG equ 0x1000

ENDSEG equ SYSSEG + SYSSIZE

ROOT_DEV equ 0x301 ;/dev/hd1

SECTION start align=16 ;vstart=0
	mov ax, BOOTSEG
	mov ds, ax
	
	mov ax, INITSEG ;将bootsec的代码从0x7c00:0000 --> 0x9000:0000
;ds:si--> es:di
;0x7c0:0 -> 0x9000:0
;cx 次数 df 方向
	mov es, ax

	mov cx, 256
	sub si, si
	sub di, di
	rep movsw
;   db 0xea dw go dw INITSEG === jmp INITSEG:[go]
	db 0xea
	dw go
	dw INITSEG

;运行一下代码时，由于改变了代码位置，所以要改变堆栈和ds等
go:
	mov ax, cs 
	mov ds, ax
	mov es, ax
	
	mov ss, ax
	mov sp, 0xFF00 ;目前代码位置为0x9000 + 256,堆栈为ss:sp 0x9ff00


;go代码配置好了实模式的运行环境，接下来可以读扇区把代码读到程序中
;使用int 13将setup模块从磁盘第二个扇区读到90200处，共度四个扇区，
;int 13的使用方法 
;ah = 02h - 读磁盘扇区的内存; al = 需要读出的扇区数量
;ch = 磁道号的低八位  cl: 开始扇区(0-5), 磁道号（6-7）
;dh = 磁头号    dl = 驱动器号(如果是硬盘则要置7)
; es:bx-> 数据缓冲区  如果出错则cf置位

clear_lcd:
	mov ah, 0x6
	mov al, 0

	mov ch, 0
	mov cl, 0
	mov dh, 80
	mov dl, 80
	int 0x10

load_setup:
	mov dx, 0x0
	mov cx, 0x2
	mov bx, 0x200
	mov ax, 0x0200 + SETUPLEN
	int 0x13
	jc exit 
	jnc ok_load_setup

ok_load_setup:
;打印loading信息
	mov cx, msg_end - msg_begin
	mov bx, 0x7
	mov bp, msg1
	mov ax, 0x1301
	int 0x10

;获取磁盘信息
	mov dl, 0x0
	mov ax, 0x0800
	int 0x13
	mov ch, 0x0
	mov [cs:sectors], cx
	mov ax, INITSEG
	mov es, ax

	mov ax, 0x0208
	cmp bx, 15
	je root_defined

root_defined:
	mov [cs:root_dev], ax
;	jmp SETUPSEG:[0]
	db 0xea
	dw 0
	dw SETUPSEG

exit:
	hlt
msg_begin:
msg1 db "Loading my system ..."	, "hello"
msg_end:
sectors dw 0  ;存放当前启动软盘每磁道的扇区数
root_dev dw ROOT_DEV
