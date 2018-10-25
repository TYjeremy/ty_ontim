00007C00  668CC8            mov eax,cs
00007C03  8ED0              mov ss,ax
00007C05  BC007C            mov sp,0x7c00
00007C08  2E66A1497D        mov eax,[cs:0x7d49]
00007C0D  6631D2            xor edx,edx
00007C10  66BB10000000      mov ebx,0x10
00007C16  66F7F3            div ebx
00007C19  8ED8              mov ds,ax
00007C1B  6689D3            mov ebx,edx
00007C1E  6667C70300000000  mov dword [ebx],0x0
00007C26  6667C74304000000  mov dword [ebx+0x4],0x0
         -00
00007C2F  6667C74308FFFF00  mov dword [ebx+0x8],0xffff
         -00
00007C38  6667C7430C0092CF  mov dword [ebx+0xc],0xcf9200
         -00
00007C41  6667C74310FF0100  mov dword [ebx+0x10],0x7c0001ff
         -7C
00007C4A  6667C74314009840  mov dword [ebx+0x14],0x409800
         -00
00007C53  6667C74318FF0100  mov dword [ebx+0x18],0x7c0001ff
         -7C
00007C5C  6667C7431C009240  mov dword [ebx+0x1c],0x409200
         -00
00007C65  6667C74320FEFF00  mov dword [ebx+0x20],0x7c00fffe
         -7C
00007C6E  6667C743240096CF  mov dword [ebx+0x24],0xcf9600
         -00
00007C77  2EC706477D2700    mov word [cs:0x7d47],0x27
00007C7E  2E0F0116477D      lgdt [cs:0x7d47]
00007C84  E492              in al,0x92
00007C86  0C02              or al,0x2
00007C88  E692              out 0x92,al
00007C8A  FA                cli
00007C8B  0F20C0            mov eax,cr0
00007C8E  6683C801          or eax,byte +0x1
00007C92  0F22C0            mov cr0,eax
00007C95  66EA9D0000001000  jmp dword 0x10:0x9d
00007C9D  B81800            mov ax,0x18
00007CA0  0000              add [bx+si],al
00007CA2  8ED8              mov ds,ax
00007CA4  B80800            mov ax,0x8
00007CA7  0000              add [bx+si],al
00007CA9  8EC0              mov es,ax
00007CAB  8EE0              mov fs,ax
00007CAD  8EE8              mov gs,ax
00007CAF  B82000            mov ax,0x20
00007CB2  0000              add [bx+si],al
00007CB4  8ED0              mov ss,ax
00007CB6  31E4              xor sp,sp
00007CB8  26C7050080        mov word [es:di],0x8000
00007CBD  0B00              or ax,[bx+si]
00007CBF  50                push ax
00007CC0  07                pop es
00007CC1  2E07              cs pop es
00007CC3  26C7050480        mov word [es:di],0x8004
00007CC8  0B00              or ax,[bx+si]
00007CCA  4D                dec bp
00007CCB  07                pop es
00007CCC  2E07              cs pop es
00007CCE  26C7050880        mov word [es:di],0x8008
00007CD3  0B00              or ax,[bx+si]
00007CD5  2007              and [bx],al
00007CD7  2007              and [bx],al
00007CD9  26C7050C80        mov word [es:di],0x800c
00007CDE  0B00              or ax,[bx+si]
00007CE0  6F                outsw
00007CE1  07                pop es
00007CE2  6B07B9            imul ax,[bx],byte -0x47
00007CE5  2400              and al,0x0
00007CE7  0000              add [bx+si],al
00007CE9  51                push cx
00007CEA  6631DB            xor ebx,ebx
00007CED  66678B87220138C4  mov eax,[edi-0x3bc7fede]
00007CF5  7D08              jnl 0x7cff
00007CF7  86C4              xchg al,ah
00007CF9  6667898722016643  mov [edi+0x43660122],eax
00007D01  E2EA              loop 0x7ced
00007D03  59                pop cx
00007D04  E2E3              loop 0x7ce9
00007D06  B92500            mov cx,0x25
00007D09  0000              add [bx+si],al
00007D0B  31DB              xor bx,bx
00007D0D  B407              mov ah,0x7
00007D0F  8A832201          mov al,[bp+di+0x122]
00007D13  0000              add [bx+si],al
00007D15  266689841BA0      mov [es:si-0x5fe5],eax
00007D1B  800B00            or byte [bp+di],0x0
00007D1E  43                inc bx
00007D1F  E2EC              loop 0x7d0d
00007D21  F4                hlt
00007D22  7330              jnc 0x7d54
00007D24  6B65346F          imul sp,[di+0x34],byte +0x6f
00007D28  7239              jc 0x7d63
00007D2A  327861            xor bh,[bx+si+0x61]
00007D2D  7033              jo 0x7d62
00007D2F  667638            o32 jna 0x7d6a
00007D32  6769757A6A63      imul si,[ebp+0x7a],word 0x636a
00007D38  7935              jns 0x7d6f
00007D3A  6C                insb
00007D3B  316D37            xor [di+0x37],bp
00007D3E  686436            push word 0x3664
00007D41  626E71            bound bp,[bp+0x71]
00007D44  7477              jz 0x7dbd
00007D46  2E0000            add [cs:bx+si],al
00007D49  007E00            add [bp+0x0],bh
00007D4C  0000              add [bx+si],al
00007D4E  0000              add [bx+si],al
00007D50  0000              add [bx+si],al
00007D52  0000              add [bx+si],al
00007D54  0000              add [bx+si],al
00007D56  0000              add [bx+si],al
00007D58  0000              add [bx+si],al
00007D5A  0000              add [bx+si],al
00007D5C  0000              add [bx+si],al
00007D5E  0000              add [bx+si],al
00007D60  0000              add [bx+si],al
00007D62  0000              add [bx+si],al
00007D64  0000              add [bx+si],al
00007D66  0000              add [bx+si],al
00007D68  0000              add [bx+si],al
00007D6A  0000              add [bx+si],al
00007D6C  0000              add [bx+si],al
00007D6E  0000              add [bx+si],al
00007D70  0000              add [bx+si],al
00007D72  0000              add [bx+si],al
00007D74  0000              add [bx+si],al
00007D76  0000              add [bx+si],al
00007D78  0000              add [bx+si],al
00007D7A  0000              add [bx+si],al
00007D7C  0000              add [bx+si],al
00007D7E  0000              add [bx+si],al
00007D80  0000              add [bx+si],al
00007D82  0000              add [bx+si],al
00007D84  0000              add [bx+si],al
00007D86  0000              add [bx+si],al
00007D88  0000              add [bx+si],al
00007D8A  0000              add [bx+si],al
00007D8C  0000              add [bx+si],al
00007D8E  0000              add [bx+si],al
00007D90  0000              add [bx+si],al
00007D92  0000              add [bx+si],al
00007D94  0000              add [bx+si],al
00007D96  0000              add [bx+si],al
00007D98  0000              add [bx+si],al
00007D9A  0000              add [bx+si],al
00007D9C  0000              add [bx+si],al
00007D9E  0000              add [bx+si],al
00007DA0  0000              add [bx+si],al
00007DA2  0000              add [bx+si],al
00007DA4  0000              add [bx+si],al
00007DA6  0000              add [bx+si],al
00007DA8  0000              add [bx+si],al
00007DAA  0000              add [bx+si],al
00007DAC  0000              add [bx+si],al
00007DAE  0000              add [bx+si],al
00007DB0  0000              add [bx+si],al
00007DB2  0000              add [bx+si],al
00007DB4  0000              add [bx+si],al
00007DB6  0000              add [bx+si],al
00007DB8  0000              add [bx+si],al
00007DBA  0000              add [bx+si],al
00007DBC  0000              add [bx+si],al
00007DBE  0000              add [bx+si],al
00007DC0  0000              add [bx+si],al
00007DC2  0000              add [bx+si],al
00007DC4  0000              add [bx+si],al
00007DC6  0000              add [bx+si],al
00007DC8  0000              add [bx+si],al
00007DCA  0000              add [bx+si],al
00007DCC  0000              add [bx+si],al
00007DCE  0000              add [bx+si],al
00007DD0  0000              add [bx+si],al
00007DD2  0000              add [bx+si],al
00007DD4  0000              add [bx+si],al
00007DD6  0000              add [bx+si],al
00007DD8  0000              add [bx+si],al
00007DDA  0000              add [bx+si],al
00007DDC  0000              add [bx+si],al
00007DDE  0000              add [bx+si],al
00007DE0  0000              add [bx+si],al
00007DE2  0000              add [bx+si],al
00007DE4  0000              add [bx+si],al
00007DE6  0000              add [bx+si],al
00007DE8  0000              add [bx+si],al
00007DEA  0000              add [bx+si],al
00007DEC  0000              add [bx+si],al
00007DEE  0000              add [bx+si],al
00007DF0  0000              add [bx+si],al
00007DF2  0000              add [bx+si],al
00007DF4  0000              add [bx+si],al
00007DF6  0000              add [bx+si],al
00007DF8  0000              add [bx+si],al
00007DFA  0000              add [bx+si],al
00007DFC  0000              add [bx+si],al
00007DFE  55                push bp
00007DFF  AA                stosb
