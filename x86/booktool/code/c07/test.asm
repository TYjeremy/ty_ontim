jmp near start

message db "1+2+3+...+100="


;显示上面的message
start:
mov ax, 0x7c0 ;引导镜像会被加载的位置
mov ds, ax

mov ax, 0xb800 ;显卡缓存
mov es, ax

mov si, message ;指针指向偏移位置
xor dx, dx
mov di, dx

mov cx, (start - message)

@a:
	mov al, [si]
	mov byte [es:di], al
	inc si
	inc di
	mov byte [es:di], 0x07
	inc di
	loop @a

;下面进行计算
xor dx, dx
mov ax, 0x0
mov bx, 0x1

@b:
	add dx, bx
	inc bx
	cmp bx, 100
	jle @b

;除法取余数, 加起来的和放在了dx中
xor cx, cx
mov ss, cx
mov sp, 0x0

mov bx, 10
mov ax, dx

@c:
	inc cx	;记录位数
	xor dx, dx
	div bx
	or dl, 0x30
	push dx
	cmp ax, 0x0
	jne @c
	
;以下显示各个数位
@d:
	pop dx
	mov byte[es:di], dl
	inc di
	mov byte[es:di], 0x07
	inc di
	loop @d


@z:
	jmp near @z


times 510 - ($ - $$) db 0x0
db 0x55, 0xaa
