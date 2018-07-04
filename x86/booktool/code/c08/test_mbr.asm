app_lba_start equ 100

SECTION mbr align=16 vstart=0x7c00
	;设置堆栈
	mov ax, 0
	mov sp, ax
	mov ss, ax

;计算用户程序的逻辑段地址
	mov ax, [cs:phy_base]
	mov dx, [cs:phy_base + 0x02]
	mov bx, 16
	div bx
	mov ds, ax			;ds和es指向该段
	mov es, ax

;下面读取硬盘内容，并加载到逻辑地址段
	xor di, di
	mov si, app_lba_start ;从扇区加载到内存
	xor bx, bx
	call read_hard_disk_0

jmp $


read_hard_disk_0: ;熟读di:si 起始逻辑扇区号 ds:bx 目标缓冲区地址 每次读取一个扇区 512byte
	push ax
	push bx
	push cx
	push dx

	mov dx, 0x1f2
	mov al, 1
	out dx, al		;读取的扇区数

	inc dx			;0x1f3
	mov ax, si		;LBA地址7--0
	out dx, al
	
	inc dx			;0x1f4
	mov al, ah		;LBA地址15--8
	out dx, al

	inc dx			;0x1f5
	mov ax, di		;LBA地址23 - 16
	out dx, al

	inc dx			;0x1f6
	mov al, 0xe0	;LBA28模式，主盘
	or al, ah		;LBA地址 27-- 24
	out dx, al

	inc dx          ;0x1f7
	mov al, 0x20	;读命令
	out dx, al
.waits:
	in al, dx
	and al, 0x88
	cmp al, 0x08
	jnz .waits					;不忙且硬盘已经准备好数据传输

	mov cx, 256
	mov dx, 0x1f0

.readw:
	in ax, dx
	mov [bx], ax
	add bx, 2
	loop .readw

	pop dx
	pop cx
	pop bx
	pop ax

	ret
phy_base dd 0x10000 ;用户程序加载的物理起始地址

;程序结尾
times (510-($-$$)) db 0
db 0x55, 0xaa
