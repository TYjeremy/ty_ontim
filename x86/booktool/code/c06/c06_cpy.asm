jmp near start ;short 128字节之内  near 一个段内  far 跳到另一个段

mytext db 'F', 0x07, 'X', 0x07, 'Z', 0x07
number db 0, 0, 0, 0, 0

start:
	mov ax, 0x7c0
	mov ds, ax		;设置数据段地址，一开机会把代码放到这个位置

	mov ax, 0xb800	
	mov es, ax		;设置显卡缓存地址

	cld				;清除方向标志df，使正方向传输
	mov si, mytext	;获得内存地址
	mov di, 0
	mov cx, (number - mytext) / 2 ;获取字符个数
	rep movsw ;movsb 和movsw 传送的地址由ds:si 和 es：di指定，字节数或者字数由cx指定，传送方向由df标志


	jmp $
	times 510 - ($ - $$) db 0
	db 0x55, 0xaa
