00007C00  8CC8              mov ax,cs
00007C02  8ED0              mov ss,ax
00007C04  BC007C            mov sp,0x7c00
00007C07  2EA10C7D          mov ax,[cs:0x7d0c]
00007C0B  2E8B160E7D        mov dx,[cs:0x7d0e]
00007C10  BB1000            mov bx,0x10
00007C13  F7F3              div bx
00007C15  8ED8              mov ds,ax
00007C17  89D3              mov bx,dx
00007C19  66C70700000000    mov dword [bx],0x0
00007C20  66C7470400000000  mov dword [bx+0x4],0x0
00007C28  66C74708FF01007C  mov dword [bx+0x8],0x7c0001ff
00007C30  66C7470C00984000  mov dword [bx+0xc],0x409800
00007C38  66C74710FFFF0080  mov dword [bx+0x10],0x8000ffff
00007C40  66C747140B924000  mov dword [bx+0x14],0x40920b
00007C48  66C74718007A0000  mov dword [bx+0x18],0x7a00
00007C50  66C7471C00964000  mov dword [bx+0x1c],0x409600
00007C58  2EC7060A7D1F00    mov word [cs:0x7d0a],0x1f
00007C5F  2E0F01160A7D      lgdt [cs:0x7d0a]
00007C65  E492              in al,0x92
00007C67  0C02              or al,0x2
00007C69  E692              out 0x92,al
00007C6B  FA                cli
00007C6C  0F20C0            mov eax,cr0
00007C6F  6683C801          or eax,byte +0x1
00007C73  0F22C0            mov cr0,eax
00007C76  66EA7E0000000800  jmp dword 0x8:0x7e
00007C7E  66B910008ED9      mov ecx,0xd98e0010
00007C84  C60500            mov byte [di],0x0
00007C87  0000              add [bx+si],al
00007C89  0050C6            add [bx+si-0x3a],dl
00007C8C  050200            add ax,0x2
00007C8F  0000              add [bx+si],al
00007C91  72C6              jc 0x7c59
00007C93  050400            add ax,0x4
00007C96  0000              add [bx+si],al
00007C98  6F                outsw
00007C99  C60506            mov byte [di],0x6
00007C9C  0000              add [bx+si],al
00007C9E  0074C6            add [si-0x3a],dh
00007CA1  050800            add ax,0x8
00007CA4  0000              add [bx+si],al
00007CA6  65C6050A          mov byte [gs:di],0xa
00007CAA  0000              add [bx+si],al
00007CAC  0063C6            add [bp+di-0x3a],ah
00007CAF  050C00            add ax,0xc
00007CB2  0000              add [bx+si],al
00007CB4  74C6              jz 0x7c7c
00007CB6  050E00            add ax,0xe
00007CB9  0000              add [bx+si],al
00007CBB  20C6              and dh,al
00007CBD  051000            add ax,0x10
00007CC0  0000              add [bx+si],al
00007CC2  6D                insw
00007CC3  C60512            mov byte [di],0x12
00007CC6  0000              add [bx+si],al
00007CC8  006FC6            add [bx-0x3a],ch
00007CCB  051400            add ax,0x14
00007CCE  0000              add [bx+si],al
00007CD0  64C60516          mov byte [fs:di],0x16
00007CD4  0000              add [bx+si],al
00007CD6  0065C6            add [di-0x3a],ah
00007CD9  051800            add ax,0x18
00007CDC  0000              add [bx+si],al
00007CDE  20C6              and dh,al
00007CE0  051A00            add ax,0x1a
00007CE3  0000              add [bx+si],al
00007CE5  4F                dec di
00007CE6  C6051C            mov byte [di],0x1c
00007CE9  0000              add [bx+si],al
00007CEB  004B66            add [bp+di+0x66],cl
00007CEE  B91800            mov cx,0x18
00007CF1  8ED1              mov ss,cx
00007CF3  BC007C            mov sp,0x7c00
00007CF6  0000              add [bx+si],al
00007CF8  89E5              mov bp,sp
00007CFA  6A2E              push byte +0x2e
00007CFC  83ED04            sub bp,byte +0x4
00007CFF  39E5              cmp bp,sp
00007D01  7506              jnz 0x7d09
00007D03  58                pop ax
00007D04  A21E00            mov [0x1e],al
00007D07  0000              add [bx+si],al
00007D09  F4                hlt
00007D0A  0000              add [bx+si],al
00007D0C  007E00            add [bp+0x0],bh
00007D0F  0000              add [bx+si],al
00007D11  0000              add [bx+si],al
00007D13  0000              add [bx+si],al
00007D15  0000              add [bx+si],al
00007D17  0000              add [bx+si],al
00007D19  0000              add [bx+si],al
00007D1B  0000              add [bx+si],al
00007D1D  0000              add [bx+si],al
00007D1F  0000              add [bx+si],al
00007D21  0000              add [bx+si],al
00007D23  0000              add [bx+si],al
00007D25  0000              add [bx+si],al
00007D27  0000              add [bx+si],al
00007D29  0000              add [bx+si],al
00007D2B  0000              add [bx+si],al
00007D2D  0000              add [bx+si],al
00007D2F  0000              add [bx+si],al
00007D31  0000              add [bx+si],al
00007D33  0000              add [bx+si],al
00007D35  0000              add [bx+si],al
00007D37  0000              add [bx+si],al
00007D39  0000              add [bx+si],al
00007D3B  0000              add [bx+si],al
00007D3D  0000              add [bx+si],al
00007D3F  0000              add [bx+si],al
00007D41  0000              add [bx+si],al
00007D43  0000              add [bx+si],al
00007D45  0000              add [bx+si],al
00007D47  0000              add [bx+si],al
00007D49  0000              add [bx+si],al
00007D4B  0000              add [bx+si],al
00007D4D  0000              add [bx+si],al
00007D4F  0000              add [bx+si],al
00007D51  0000              add [bx+si],al
00007D53  0000              add [bx+si],al
00007D55  0000              add [bx+si],al
00007D57  0000              add [bx+si],al
00007D59  0000              add [bx+si],al
00007D5B  0000              add [bx+si],al
00007D5D  0000              add [bx+si],al
00007D5F  0000              add [bx+si],al
00007D61  0000              add [bx+si],al
00007D63  0000              add [bx+si],al
00007D65  0000              add [bx+si],al
00007D67  0000              add [bx+si],al
00007D69  0000              add [bx+si],al
00007D6B  0000              add [bx+si],al
00007D6D  0000              add [bx+si],al
00007D6F  0000              add [bx+si],al
00007D71  0000              add [bx+si],al
00007D73  0000              add [bx+si],al
00007D75  0000              add [bx+si],al
00007D77  0000              add [bx+si],al
00007D79  0000              add [bx+si],al
00007D7B  0000              add [bx+si],al
00007D7D  0000              add [bx+si],al
00007D7F  0000              add [bx+si],al
00007D81  0000              add [bx+si],al
00007D83  0000              add [bx+si],al
00007D85  0000              add [bx+si],al
00007D87  0000              add [bx+si],al
00007D89  0000              add [bx+si],al
00007D8B  0000              add [bx+si],al
00007D8D  0000              add [bx+si],al
00007D8F  0000              add [bx+si],al
00007D91  0000              add [bx+si],al
00007D93  0000              add [bx+si],al
00007D95  0000              add [bx+si],al
00007D97  0000              add [bx+si],al
00007D99  0000              add [bx+si],al
00007D9B  0000              add [bx+si],al
00007D9D  0000              add [bx+si],al
00007D9F  0000              add [bx+si],al
00007DA1  0000              add [bx+si],al
00007DA3  0000              add [bx+si],al
00007DA5  0000              add [bx+si],al
00007DA7  0000              add [bx+si],al
00007DA9  0000              add [bx+si],al
00007DAB  0000              add [bx+si],al
00007DAD  0000              add [bx+si],al
00007DAF  0000              add [bx+si],al
00007DB1  0000              add [bx+si],al
00007DB3  0000              add [bx+si],al
00007DB5  0000              add [bx+si],al
00007DB7  0000              add [bx+si],al
00007DB9  0000              add [bx+si],al
00007DBB  0000              add [bx+si],al
00007DBD  0000              add [bx+si],al
00007DBF  0000              add [bx+si],al
00007DC1  0000              add [bx+si],al
00007DC3  0000              add [bx+si],al
00007DC5  0000              add [bx+si],al
00007DC7  0000              add [bx+si],al
00007DC9  0000              add [bx+si],al
00007DCB  0000              add [bx+si],al
00007DCD  0000              add [bx+si],al
00007DCF  0000              add [bx+si],al
00007DD1  0000              add [bx+si],al
00007DD3  0000              add [bx+si],al
00007DD5  0000              add [bx+si],al
00007DD7  0000              add [bx+si],al
00007DD9  0000              add [bx+si],al
00007DDB  0000              add [bx+si],al
00007DDD  0000              add [bx+si],al
00007DDF  0000              add [bx+si],al
00007DE1  0000              add [bx+si],al
00007DE3  0000              add [bx+si],al
00007DE5  0000              add [bx+si],al
00007DE7  0000              add [bx+si],al
00007DE9  0000              add [bx+si],al
00007DEB  0000              add [bx+si],al
00007DED  0000              add [bx+si],al
00007DEF  0000              add [bx+si],al
00007DF1  0000              add [bx+si],al
00007DF3  0000              add [bx+si],al
00007DF5  0000              add [bx+si],al
00007DF7  0000              add [bx+si],al
00007DF9  0000              add [bx+si],al
00007DFB  0000              add [bx+si],al
00007DFD  0055AA            add [di-0x56],dl
