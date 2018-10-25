mov eax, cs
mov ss, eax
mov sp, 0x7c00

mov eax, [cs:pgdt + 0x7c00 + 0x02]
xor edx, edx
mov ebx, 16
div ebx			;分出段地址

mov ds, eax
mov ebx, edx	;段内偏移地址

;创建描述符 0
mov dword [ebx + 0x00], 0x0
mov dword [ebx + 0x04], 0x0

;描述符 1
mov dword [ebx+0x10], 0x0000ffff
mov dword [ebx+0x0c], 0x00cf9200

;描述符2
mov dword [ebx + 0x10], 0x7c0001ff
mov dword [ebx + 0x14], 0x00409800

;描述符3
mov dword [ebx + 0x18], 0x7c001ff
mov dword [ebx + 0x1c], 0x00409200

;描述符4
mov dword [ebx + 0x20], 0x7c00fffe
mov dword [ebx + 0x24], 0x00cf9600

;初始化描述符表寄存器GDTR
mov word [cs:pgdt + 0x7c00], 39

lgdt [cs: pgdt + 0x7c00]

in al, 0x92		;南桥芯片 A20
or al, 0000_0010B
out 0x92, al	;打开A20

cli

mov eax, cr0
or eax, 1
mov cr0, eax

;以下进入保护模式
jmp dword 0x0010:flush

[bits 32]
flush:
	mov eax, 0x0018
	mov ds, eax

	mov eax, 0x0008
	mov es, eax
	mov fs, eax
	mov gs, eax

	mov eax, 0x0020
	mov ss, eax
	xor esp, esp

         mov dword [es:0x0b8000],0x072e0750 ;字符'P'、'.'及其显示属性
         mov dword [es:0x0b8004],0x072e074d ;字符'M'、'.'及其显示属性
         mov dword [es:0x0b8008],0x07200720 ;两个空白字符及其显示属性
         mov dword [es:0x0b800c],0x076b076f ;字符'o'、'k'及其显示属性
hlt



string db 'fanxzh9876543210'

pgdt:
	dw	0
	dd 0x00007e00	;GDT的物理地址

times 510 - ($ - $$) db 0
		db 0x55, 0xaa
