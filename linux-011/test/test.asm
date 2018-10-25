start:
	mov ax, 0x100
	mov ds, ax
	lds si, [0x200]
	hlt
