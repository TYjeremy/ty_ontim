SECTION header vstart=0
	program_length dd program_end

	code_entry	dw	start
		    	dd section.code.start
	
	realloc_tbl_len dw (header_end - realloc_begin)/4 ;段重定位个数


	;段重定位表
	realloc_begin:
	code_segment	dd section.code.start	;[0x0c]
	data_segment	dd section.data.start	;[0x14]
	stack_segment	dd section.stack.start	;[0x1c]
header_end:

SECTION	code align=16 vstart=0		;定义代码段 16位对齐
new_int_0x70:
	push ax
	push bx
	push cs
	push dx
	push es

.w0:
	mov al, 0x0a ;阻断nmi
	or al, 0x80
	out 0x70, al
	in al, 0x71	;读寄存器
	test al, 0x80
	jnz .w0			;测试第7位UIP

	xor al, al
	or al, 0x80
	out 0x70, al
	in al, 0x71
	push ax		;读rtc当前时间 秒

	mov al, 2
	or al, 0x80
	out 0x70, al
	in al, 0x71
	push ax				;读rtc 分

	mov al, 4
	or al, 0x80
	out 0x70, al
	in al, 0x71
	push ax			;读rtc  时

	mov al, 0x0c	;寄存器c的索引，开放nmi
	out 0x70, al
	in al, 0x71		;读rtc寄存器，否则只发生一次中断

	mov ax, 0xb800
	mov es, ax

	pop ax
	call bcd_to_ascii
	mov bx, 12*160 + 36 * 2 ;从屏幕上的12行36列开始

	mov [es:bx], ah
	mov [es:bx+2], al

	mov al, ":"
	mov [es:bx+4], al
	not byte [es:bx+5]
	
	pop ax
	call bcd_to_ascii
	mov [es:bx+6], ah
	mov [es:bx+8], al

	mov al, ':'
	mov [es:bx+10], al
	not byte [es:bx+11]

	pop ax
	call bcd_to_ascii
	mov [es:bx+12], ah
	mov [es:bx+14], al ;显示两位小时数字

	mov al, 0x20	;中断结束命令EOI
	out 0xa0, al	;向从片发送
	out 0x20, al	;向主片发送
	

	pop es
	pop dx
	pop cx
	pop bx
	pop ax

	iret


;-------------------------------------------------------
bcd_to_ascii:			;BCD码转ASCII
	mov ah, al			;输入： AL = bcd码
	and al, 0x0f 		;输出   AX=ascii
	add al, 0x30		;分拆成两个数字
	shr ah, 4			;仅保留低四位
	and ah, 0x0f		;转换成ASCII
	add ah, 0x30

	ret

;-----------------------------------------------------------
start:
	mov ax, [stack_segment]
	mov ss, ax
	mov sp, ss_pointer
	mov ax, [data_segment]
	mov ds, ax

	mov bx, init_msg		;显示初始信息
	call put_string

	mov bx, inst_msg		;显示安装信息
	call put_string

	mov al, 0x70
	mov bl, 4
	mul bl			;计算0x70号中断在IVT下的偏移
	mov bx, ax

	cli				;清中断，防止中断产生

	push es
	mov ax, 0x0
	mov es, ax
	mov word [es:bx], new_int_0x70 ;偏移地址

	mov word	[es:bx+2], cs
	pop es

      mov al,0x0b                        ;RTC寄存器B
      or al,0x80                         ;阻断NMI 
      out 0x70,al
      mov al,0x12                        ;设置寄存器B，禁止周期性中断，开放更 
      out 0x71,al                        ;新结束后中断，BCD码，24小时制 

      mov al,0x0c
      out 0x70,al
      in al,0x71                         ;读RTC寄存器C，复位未决的中断状态

      in al,0xa1                         ;读8259从片的IMR寄存器 
      and al,0xfe                        ;清除bit 0(此位连接RTC)
      out 0xa1,al                        ;写回此寄存器 

      sti                                ;重新开放中断 

	mov bx, done_msg
	call put_string
	
	mov cx, 0xb800
	mov ds, cx
	mov byte [12*160 + 33*2], '@'

;---------------------------------------------------
.idle:
	hlt		;使cpu进入低功耗状态，直到中断唤醒
	not byte [12*160 + 33 * 2 + 1]
	jmp .idle

;--------------------------------------------------
put_string:			;显示串0结尾 输入ds:bx=串地址
	mov cl, [bx]	;反转显示属性
	or cl, cl
	jz .exit
	call put_char
	inc bx
	jmp put_string

	.exit: 
		ret

put_char:		;显示一个字符， 输入cl=字符ascii
	push ax
	push bx
	push cx
	push dx
	push ds
	push es

;以下选取当前光标位置
	mov dx, 0x3d4
	mov al, 0x0e
	out dx, al
	mov dx, 0x3d5
	in al, dx
	mov ah, al
	
	mov dx, 0x3d4
	mov al, 0x0f
	out dx, al
	mov dx, 0x3d5
	in al, dx
	mov bx, ax		;低8位，BX代表当前光标位置的16位数


	cmp cl, 0x0d		;回车符？
	jnz	.put_0a
	mov ax, bx
	mov bl, 80
	div bl
	mul bl
	mov bx, ax
	jmp .set_cursor

 .put_0a:
         cmp cl,0x0a                     ;换行符？
         jnz .put_other                  ;不是，那就正常显示字符 
         add bx,80
         jmp .roll_screen

 .put_other:                             ;正常显示字符
         mov ax,0xb800
         mov es,ax
         shl bx,1
         mov [es:bx],cl

         ;以下将光标位置推进一个字符
         shr bx,1
         add bx,1

 .roll_screen:
         cmp bx,2000                     ;光标超出屏幕？滚屏
         jl .set_cursor

         mov ax,0xb800
         mov ds,ax
         mov es,ax
         cld
         mov si,0xa0
         mov di,0x00
         mov cx,1920
         rep movsw
         mov bx,3840                     ;清除屏幕最底一行
         mov cx,80
 .cls:
         mov word[es:bx],0x0720
         add bx,2
         loop .cls

         mov bx,1920

 .set_cursor:
         mov dx,0x3d4
         mov al,0x0e
         out dx,al
         mov dx,0x3d5
         mov al,bh
         out dx,al
         mov dx,0x3d4
         mov al,0x0f
         out dx,al
         mov dx,0x3d5
         mov al,bl
         out dx,al

	pop es
	pop ds
	pop dx
	pop cx
	pop bx
	pop ax
	ret





;============================================================
SECTION data align=16 vstart=0
	init_msg	db	'Starting...',0x0d, 0x0a, 0

	inst_msg	db	'Installing a new interrupt 70H...', 0

	done_msg	db	'Done.',0x0d, 0x0a, 0

	tips_msg	db	'Clock is now working.', 0

;======================================================
SECTION  stack align=16 vstart=0
		resb 256
ss_pointer:


;===================================================

SECTION program_trail
program_end:
