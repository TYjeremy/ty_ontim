00000000  8CC8              mov ax,cs
00000002  8ED0              mov ss,ax
00000004  BC007C            mov sp,0x7c00
00000007  2EA10C7D          mov ax,[cs:0x7d0c]
0000000B  2E8B160E7D        mov dx,[cs:0x7d0e]
00000010  BB1000            mov bx,0x10
00000013  F7F3              div bx
00000015  8ED8              mov ds,ax
00000017  89D3              mov bx,dx
00000019  66C70700000000    mov dword [bx],0x0
00000020  66C7470400000000  mov dword [bx+0x4],0x0
00000028  66C74708FF01007C  mov dword [bx+0x8],0x7c0001ff
00000030  66C7470C00984000  mov dword [bx+0xc],0x409800
00000038  66C74710FFFF0080  mov dword [bx+0x10],0x8000ffff
00000040  66C747140B924000  mov dword [bx+0x14],0x40920b
00000048  66C74718007A0000  mov dword [bx+0x18],0x7a00
00000050  66C7471C00964000  mov dword [bx+0x1c],0x409600
00000058  2EC7060A7D1F00    mov word [cs:0x7d0a],0x1f
0000005F  2E0F01160A7D      lgdt [cs:0x7d0a]
00000065  E492              in al,0x92
00000067  0C02              or al,0x2
00000069  E692              out 0x92,al
0000006B  FA                cli
0000006C  0F20C0            mov eax,cr0
0000006F  6683C801          or eax,byte +0x1
00000073  0F22C0            mov cr0,eax
00000076  66EA7E0000000800  jmp dword 0x8:0x7e
0000007E  66B910008ED9      mov ecx,0xd98e0010
00000084  C60500            mov byte [di],0x0
00000087  0000              add [bx+si],al
00000089  0050C6            add [bx+si-0x3a],dl
0000008C  050200            add ax,0x2
0000008F  0000              add [bx+si],al
00000091  72C6              jc 0x59
00000093  050400            add ax,0x4
00000096  0000              add [bx+si],al
00000098  6F                outsw
00000099  C60506            mov byte [di],0x6
0000009C  0000              add [bx+si],al
0000009E  0074C6            add [si-0x3a],dh
000000A1  050800            add ax,0x8
000000A4  0000              add [bx+si],al
000000A6  65C6050A          mov byte [gs:di],0xa
000000AA  0000              add [bx+si],al
000000AC  0063C6            add [bp+di-0x3a],ah
000000AF  050C00            add ax,0xc
000000B2  0000              add [bx+si],al
000000B4  74C6              jz 0x7c
000000B6  050E00            add ax,0xe
000000B9  0000              add [bx+si],al
000000BB  20C6              and dh,al
000000BD  051000            add ax,0x10
000000C0  0000              add [bx+si],al
000000C2  6D                insw
000000C3  C60512            mov byte [di],0x12
000000C6  0000              add [bx+si],al
000000C8  006FC6            add [bx-0x3a],ch
000000CB  051400            add ax,0x14
000000CE  0000              add [bx+si],al
000000D0  64C60516          mov byte [fs:di],0x16
000000D4  0000              add [bx+si],al
000000D6  0065C6            add [di-0x3a],ah
000000D9  051800            add ax,0x18
000000DC  0000              add [bx+si],al
000000DE  20C6              and dh,al
000000E0  051A00            add ax,0x1a
000000E3  0000              add [bx+si],al
000000E5  4F                dec di
000000E6  C6051C            mov byte [di],0x1c
000000E9  0000              add [bx+si],al
000000EB  004B66            add [bp+di+0x66],cl
000000EE  B91800            mov cx,0x18
000000F1  8ED1              mov ss,cx
000000F3  BC007C            mov sp,0x7c00
000000F6  0000              add [bx+si],al
000000F8  89E5              mov bp,sp
000000FA  6A2E              push byte +0x2e
000000FC  83ED04            sub bp,byte +0x4
000000FF  39E5              cmp bp,sp
00000101  7506              jnz 0x109
00000103  58                pop ax
00000104  A21E00            mov [0x1e],al
00000107  0000              add [bx+si],al
00000109  F4                hlt
0000010A  0000              add [bx+si],al
0000010C  007E00            add [bp+0x0],bh
0000010F  0000              add [bx+si],al
00000111  0000              add [bx+si],al
00000113  0000              add [bx+si],al
00000115  0000              add [bx+si],al
00000117  0000              add [bx+si],al
00000119  0000              add [bx+si],al
0000011B  0000              add [bx+si],al
0000011D  0000              add [bx+si],al
0000011F  0000              add [bx+si],al
00000121  0000              add [bx+si],al
00000123  0000              add [bx+si],al
00000125  0000              add [bx+si],al
00000127  0000              add [bx+si],al
00000129  0000              add [bx+si],al
0000012B  0000              add [bx+si],al
0000012D  0000              add [bx+si],al
0000012F  0000              add [bx+si],al
00000131  0000              add [bx+si],al
00000133  0000              add [bx+si],al
00000135  0000              add [bx+si],al
00000137  0000              add [bx+si],al
00000139  0000              add [bx+si],al
0000013B  0000              add [bx+si],al
0000013D  0000              add [bx+si],al
0000013F  0000              add [bx+si],al
00000141  0000              add [bx+si],al
00000143  0000              add [bx+si],al
00000145  0000              add [bx+si],al
00000147  0000              add [bx+si],al
00000149  0000              add [bx+si],al
0000014B  0000              add [bx+si],al
0000014D  0000              add [bx+si],al
0000014F  0000              add [bx+si],al
00000151  0000              add [bx+si],al
00000153  0000              add [bx+si],al
00000155  0000              add [bx+si],al
00000157  0000              add [bx+si],al
00000159  0000              add [bx+si],al
0000015B  0000              add [bx+si],al
0000015D  0000              add [bx+si],al
0000015F  0000              add [bx+si],al
00000161  0000              add [bx+si],al
00000163  0000              add [bx+si],al
00000165  0000              add [bx+si],al
00000167  0000              add [bx+si],al
00000169  0000              add [bx+si],al
0000016B  0000              add [bx+si],al
0000016D  0000              add [bx+si],al
0000016F  0000              add [bx+si],al
00000171  0000              add [bx+si],al
00000173  0000              add [bx+si],al
00000175  0000              add [bx+si],al
00000177  0000              add [bx+si],al
00000179  0000              add [bx+si],al
0000017B  0000              add [bx+si],al
0000017D  0000              add [bx+si],al
0000017F  0000              add [bx+si],al
00000181  0000              add [bx+si],al
00000183  0000              add [bx+si],al
00000185  0000              add [bx+si],al
00000187  0000              add [bx+si],al
00000189  0000              add [bx+si],al
0000018B  0000              add [bx+si],al
0000018D  0000              add [bx+si],al
0000018F  0000              add [bx+si],al
00000191  0000              add [bx+si],al
00000193  0000              add [bx+si],al
00000195  0000              add [bx+si],al
00000197  0000              add [bx+si],al
00000199  0000              add [bx+si],al
0000019B  0000              add [bx+si],al
0000019D  0000              add [bx+si],al
0000019F  0000              add [bx+si],al
000001A1  0000              add [bx+si],al
000001A3  0000              add [bx+si],al
000001A5  0000              add [bx+si],al
000001A7  0000              add [bx+si],al
000001A9  0000              add [bx+si],al
000001AB  0000              add [bx+si],al
000001AD  0000              add [bx+si],al
000001AF  0000              add [bx+si],al
000001B1  0000              add [bx+si],al
000001B3  0000              add [bx+si],al
000001B5  0000              add [bx+si],al
000001B7  0000              add [bx+si],al
000001B9  0000              add [bx+si],al
000001BB  0000              add [bx+si],al
000001BD  0000              add [bx+si],al
000001BF  0000              add [bx+si],al
000001C1  0000              add [bx+si],al
000001C3  0000              add [bx+si],al
000001C5  0000              add [bx+si],al
000001C7  0000              add [bx+si],al
000001C9  0000              add [bx+si],al
000001CB  0000              add [bx+si],al
000001CD  0000              add [bx+si],al
000001CF  0000              add [bx+si],al
000001D1  0000              add [bx+si],al
000001D3  0000              add [bx+si],al
000001D5  0000              add [bx+si],al
000001D7  0000              add [bx+si],al
000001D9  0000              add [bx+si],al
000001DB  0000              add [bx+si],al
000001DD  0000              add [bx+si],al
000001DF  0000              add [bx+si],al
000001E1  0000              add [bx+si],al
000001E3  0000              add [bx+si],al
000001E5  0000              add [bx+si],al
000001E7  0000              add [bx+si],al
000001E9  0000              add [bx+si],al
000001EB  0000              add [bx+si],al
000001ED  0000              add [bx+si],al
000001EF  0000              add [bx+si],al
000001F1  0000              add [bx+si],al
000001F3  0000              add [bx+si],al
000001F5  0000              add [bx+si],al
000001F7  0000              add [bx+si],al
000001F9  0000              add [bx+si],al
000001FB  0000              add [bx+si],al
000001FD  0055AA            add [di-0x56],dl
