00000000  B80000            mov ax,0x0
00000003  8ED0              mov ss,ax
00000005  89C4              mov sp,ax
00000007  2EA1C77C          mov ax,[cs:0x7cc7]
0000000B  2E8B16C97C        mov dx,[cs:0x7cc9]
00000010  BB1000            mov bx,0x10
00000013  F7F3              div bx
00000015  8ED8              mov ds,ax
00000017  8EC0              mov es,ax
00000019  31FF              xor di,di
0000001B  BE6400            mov si,0x64
0000001E  31DB              xor bx,bx
00000020  E85100            call word 0x74
00000023  8B160200          mov dx,[0x2]
00000027  A10000            mov ax,[0x0]
0000002A  BB0002            mov bx,0x200
0000002D  F7F3              div bx
0000002F  83FA00            cmp dx,byte +0x0
00000032  7501              jnz 0x35
00000034  48                dec ax
00000035  83F800            cmp ax,byte +0x0
00000038  7413              jz 0x4d
0000003A  1E                push ds
0000003B  89C1              mov cx,ax
0000003D  8CD8              mov ax,ds
0000003F  83C020            add ax,byte +0x20
00000042  8ED8              mov ds,ax
00000044  31DB              xor bx,bx
00000046  46                inc si
00000047  E82A00            call word 0x74
0000004A  E2F1              loop 0x3d
0000004C  1F                pop ds
0000004D  8B160800          mov dx,[0x8]
00000051  A10600            mov ax,[0x6]
00000054  E85700            call word 0xae
00000057  A30600            mov [0x6],ax
0000005A  8B0E0A00          mov cx,[0xa]
0000005E  BB0C00            mov bx,0xc
00000061  8B5702            mov dx,[bx+0x2]
00000064  8B07              mov ax,[bx]
00000066  E84500            call word 0xae
00000069  8907              mov [bx],ax
0000006B  83C304            add bx,byte +0x4
0000006E  E2F1              loop 0x61
00000070  FF2E0400          jmp word far [0x4]
00000074  50                push ax
00000075  53                push bx
00000076  51                push cx
00000077  52                push dx
00000078  BAF201            mov dx,0x1f2
0000007B  B001              mov al,0x1
0000007D  EE                out dx,al
0000007E  42                inc dx
0000007F  89F0              mov ax,si
00000081  EE                out dx,al
00000082  42                inc dx
00000083  88E0              mov al,ah
00000085  EE                out dx,al
00000086  42                inc dx
00000087  89F8              mov ax,di
00000089  EE                out dx,al
0000008A  42                inc dx
0000008B  B0E0              mov al,0xe0
0000008D  08E0              or al,ah
0000008F  EE                out dx,al
00000090  42                inc dx
00000091  B020              mov al,0x20
00000093  EE                out dx,al
00000094  EC                in al,dx
00000095  2488              and al,0x88
00000097  3C08              cmp al,0x8
00000099  75F9              jnz 0x94
0000009B  B90001            mov cx,0x100
0000009E  BAF001            mov dx,0x1f0
000000A1  ED                in ax,dx
000000A2  8907              mov [bx],ax
000000A4  83C302            add bx,byte +0x2
000000A7  E2F8              loop 0xa1
000000A9  5A                pop dx
000000AA  59                pop cx
000000AB  5B                pop bx
000000AC  58                pop ax
000000AD  C3                ret
000000AE  52                push dx
000000AF  2E0306C77C        add ax,[cs:0x7cc7]
000000B4  2E1316C97C        adc dx,[cs:0x7cc9]
000000B9  C1E804            shr ax,byte 0x4
000000BC  C1CA04            ror dx,byte 0x4
000000BF  81E200F0          and dx,0xf000
000000C3  09D0              or ax,dx
000000C5  5A                pop dx
000000C6  C3                ret
000000C7  0000              add [bx+si],al
000000C9  0100              add [bx+si],ax
000000CB  0000              add [bx+si],al
000000CD  0000              add [bx+si],al
000000CF  0000              add [bx+si],al
000000D1  0000              add [bx+si],al
000000D3  0000              add [bx+si],al
000000D5  0000              add [bx+si],al
000000D7  0000              add [bx+si],al
000000D9  0000              add [bx+si],al
000000DB  0000              add [bx+si],al
000000DD  0000              add [bx+si],al
000000DF  0000              add [bx+si],al
000000E1  0000              add [bx+si],al
000000E3  0000              add [bx+si],al
000000E5  0000              add [bx+si],al
000000E7  0000              add [bx+si],al
000000E9  0000              add [bx+si],al
000000EB  0000              add [bx+si],al
000000ED  0000              add [bx+si],al
000000EF  0000              add [bx+si],al
000000F1  0000              add [bx+si],al
000000F3  0000              add [bx+si],al
000000F5  0000              add [bx+si],al
000000F7  0000              add [bx+si],al
000000F9  0000              add [bx+si],al
000000FB  0000              add [bx+si],al
000000FD  0000              add [bx+si],al
000000FF  0000              add [bx+si],al
00000101  0000              add [bx+si],al
00000103  0000              add [bx+si],al
00000105  0000              add [bx+si],al
00000107  0000              add [bx+si],al
00000109  0000              add [bx+si],al
0000010B  0000              add [bx+si],al
0000010D  0000              add [bx+si],al
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
