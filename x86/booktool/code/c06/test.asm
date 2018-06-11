jmp near start

mytext db 'f',0x07,'a',0x07,'n',0x07,'x',0x07,'i',0x07,' ',0x07,'a',0x07,\
'o',0x07,'z',0x07,'h',0x07,'e',0x07,'n',0x07,':',0x07
number db 0,0,0,0,0

start:
 mov ax, 0x7c0	;设置数据段地址
 mov ds, ax

mov ax, 0xb800	;设置附加段基地址
mov es, ax

cld				;设置正传送方向
mov si, mytext	;ds:si 源
mov di, 0		;es:di 目

mov cx, (number - mytext)/2 ; 总的需要打印的个数
rep movsw ;rep 的意思是cx不为0， 则重复

;得到标号所代表的偏移地址
mov ax, number

;计算各个数位
;mov bx, ax
;mov cx, 5
;mov si, 10
;
;digit:
;	xor dx, dx
;	div si
;	mov [bx], dl	;保存数位
;	inc bx
;	loop digit
;
;;显示各个数位
;mov bx,number
;mov si,4
;
;show:
;	mov al,[bx+si]
;	add al, 0x30
;	mov ah, 0x04
;	mov [es:di], ax
;	add di, 2
;	dec si
;	jns show
;
;	mov word [es:di], 0x0744
;
	jmp near $

times 510 - ($-$$) db 0
db 0x55, 0xaa
