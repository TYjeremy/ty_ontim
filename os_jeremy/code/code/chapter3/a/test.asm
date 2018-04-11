%include "pm.inc"

org 07c00h
	jmp LABEL_BEGIN

[SECTION .gdt]
; GDT
LABLE_GDT: Descriptor	0,	0,	0
LABEL_DESC_CODE32: Descriptor	0,	SegCode32Len - 1, DA_C + DA_32
LABEL_DESC_VIDEO: Descriptor 0B8000h, 0ffffh, DA_DRM

GdtLen	equ $ - LABLE_GDT
Gdt Ptr dw GdtLen - 1
dd	0

SelectorCode32	equ LABEL_DESC_CODE32 - LABEL_GDT
