%include "pm.inc"

org 0100h
jmp LABEL_BEGIN


[SECTION .gdt]
;GDT
LABEL_GDT: Descriptor 0, 0, 0  ;空描述符
LABEL_DESC_NORMAL: Descriptor 0, 0ffffh, DA_DRW ;Normal描述符
LABEL_DESC_CODE32: Descriptor 0, SegCode32Len-1, DA_C+DA_32
LABEL_DESC_CODE16: Descriptor 0, 0ffffh, DA_C ;非一致代码段
LABEL_DESC_DATA: Descriptor 0, DataLen-1, DA_DRW ;Data
LABEL_DESC_STACK: Descriptor 0, TopOfStack, DA_DRWA+DA_32; Stack, 32bit
LABEL_DESC_TEST: Descriptor 0500000h, 0ffffh, DA_DRW
LABEL_DESC_VIDEO: Descriptor 0B8000h, 0ffffh, DA_DRW ;显存首地址


GdtLen	equ $ - LABEL_GDT ;GDT长度
GdtPtr	dw GdtLen - 1 ;Gdt界限
dd	0 ;GDT基地址

;GDT 选择子
SelectorNormal	equ LABEL_DESC_NORMAL - LABEL_GDT
SelectorCode32	equ LABEL_DESC_CODE32 - LABEL_GDT
SelectorCode16	equ LABEL_DESC_CODE16 - LABEL_GDT
SelectorData	equ LABEL_DESC_DATA - LABEL_GDT
SelectorStack	equ LABEL_DESC_STACK - LABEL_GDT
SelectorTest	equ LABEL_DESC_TEST	- LABEL_GDT
SelectorVideo	equ LABEL_DESC_VIDEO - LABEL_GDT
;END of [SECTION .gdt]

[SECTION .data1] ;数据段
ALIGN 32
[BITS 32]
LABEL_DATA:
SPValueInRealMode dw 0
;字符串
PMMessage: db "In Protect Mode now. ^-^", 0 ;在保护模式下显示
OffsetPMMessage equ PMMessage - $$
StrTest: db "ABCDEFGHIJKLMN", 0
OffsetStrTest equ StrTest - $$
DataLen equ $ - LABEL_DATA
; END of [SECTION .data1]

; 全局堆栈段
[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
	times 512 db 0

TopOfStack equ $ - LABEL_STACK - 1
; END of [SECTION .gs]

[SECTION .s16]
[BITS 16]
LABEL_BEGIN:
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ss, ax

	jmp $

SegCode32Len equ 01111h


;16位代码，由32位代码段跳入，跳出后到实模式
[SECTION .s16code]
ALIGN 32
[BITS 16]
LABEL_SEG_CODE16:
	;调回实模式
	mov ax, SelectorNormal
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov eax, cr0
	and al, 11111110b
	mov cr0, eax

LABEL_GO_BACK_TO_REAL:
	jmp 0:LABEL_REAL_ENTRY
