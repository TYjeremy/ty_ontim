00000000  0003              add [bp+di],al
00000002  0000              add [bx+si],al
00000004  8D00              lea ax,[bx+si]
00000006  2000              and [bx+si],al
00000008  0000              add [bx+si],al
0000000A  0300              add ax,[bx+si]
0000000C  2000              and [bx+si],al
0000000E  0000              add [bx+si],al
00000010  B001              mov al,0x1
00000012  0000              add [bx+si],al
00000014  0002              add [bp+si],al
00000016  0000              add [bx+si],al
00000018  0000              add [bx+si],al
0000001A  0000              add [bx+si],al
0000001C  0000              add [bx+si],al
0000001E  0000              add [bx+si],al
00000020  50                push ax
00000021  53                push bx
00000022  0E                push cs
00000023  52                push dx
00000024  06                push es
00000025  B00A              mov al,0xa
00000027  0C80              or al,0x80
00000029  E670              out 0x70,al
0000002B  E471              in al,0x71
0000002D  A880              test al,0x80
0000002F  75F4              jnz 0x25
00000031  30C0              xor al,al
00000033  0C80              or al,0x80
00000035  E670              out 0x70,al
00000037  E471              in al,0x71
00000039  50                push ax
0000003A  B002              mov al,0x2
0000003C  0C80              or al,0x80
0000003E  E670              out 0x70,al
00000040  E471              in al,0x71
00000042  50                push ax
00000043  B004              mov al,0x4
00000045  0C80              or al,0x80
00000047  E670              out 0x70,al
00000049  E471              in al,0x71
0000004B  50                push ax
0000004C  B00C              mov al,0xc
0000004E  E670              out 0x70,al
00000050  E471              in al,0x71
00000052  B800B8            mov ax,0xb800
00000055  8EC0              mov es,ax
00000057  58                pop ax
00000058  E84200            call word 0x9d
0000005B  BBC807            mov bx,0x7c8
0000005E  268827            mov [es:bx],ah
00000061  26884702          mov [es:bx+0x2],al
00000065  B03A              mov al,0x3a
00000067  26884704          mov [es:bx+0x4],al
0000006B  26F65705          not byte [es:bx+0x5]
0000006F  58                pop ax
00000070  E82A00            call word 0x9d
00000073  26886706          mov [es:bx+0x6],ah
00000077  26884708          mov [es:bx+0x8],al
0000007B  B03A              mov al,0x3a
0000007D  2688470A          mov [es:bx+0xa],al
00000081  26F6570B          not byte [es:bx+0xb]
00000085  58                pop ax
00000086  E81400            call word 0x9d
00000089  2688670C          mov [es:bx+0xc],ah
0000008D  2688470E          mov [es:bx+0xe],al
00000091  B020              mov al,0x20
00000093  E6A0              out 0xa0,al
00000095  E620              out 0x20,al
00000097  07                pop es
00000098  5A                pop dx
00000099  59                pop cx
0000009A  5B                pop bx
0000009B  58                pop ax
0000009C  CF                iretw
0000009D  88C4              mov ah,al
0000009F  240F              and al,0xf
000000A1  0430              add al,0x30
000000A3  C0EC04            shr ah,byte 0x4
000000A6  80E40F            and ah,0xf
000000A9  80C430            add ah,0x30
000000AC  C3                ret
000000AD  A11400            mov ax,[0x14]
000000B0  8ED0              mov ss,ax
000000B2  BC0001            mov sp,0x100
000000B5  A11000            mov ax,[0x10]
000000B8  8ED8              mov ds,ax
000000BA  BB0000            mov bx,0x0
000000BD  E84D00            call word 0x10d
000000C0  BB0E00            mov bx,0xe
000000C3  E84700            call word 0x10d
000000C6  B070              mov al,0x70
000000C8  B304              mov bl,0x4
000000CA  F6E3              mul bl
000000CC  89C3              mov bx,ax
000000CE  FA                cli
000000CF  06                push es
000000D0  B80000            mov ax,0x0
000000D3  8EC0              mov es,ax
000000D5  26C7070000        mov word [es:bx],0x0
000000DA  268C4F02          mov [es:bx+0x2],cs
000000DE  07                pop es
000000DF  B00B              mov al,0xb
000000E1  0C80              or al,0x80
000000E3  E670              out 0x70,al
000000E5  B012              mov al,0x12
000000E7  E671              out 0x71,al
000000E9  B00C              mov al,0xc
000000EB  E670              out 0x70,al
000000ED  E471              in al,0x71
000000EF  E4A1              in al,0xa1
000000F1  24FE              and al,0xfe
000000F3  E6A1              out 0xa1,al
000000F5  FB                sti
000000F6  BB3000            mov bx,0x30
000000F9  E81100            call word 0x10d
000000FC  B900B8            mov cx,0xb800
000000FF  8ED9              mov ds,cx
00000101  C606C20740        mov byte [0x7c2],0x40
00000106  F4                hlt
00000107  F616C307          not byte [0x7c3]
0000010B  EBF9              jmp short 0x106
0000010D  8A0F              mov cl,[bx]
0000010F  08C9              or cl,cl
00000111  7406              jz 0x119
00000113  E80400            call word 0x11a
00000116  43                inc bx
00000117  EBF4              jmp short 0x10d
00000119  C3                ret
0000011A  50                push ax
0000011B  53                push bx
0000011C  51                push cx
0000011D  52                push dx
0000011E  1E                push ds
0000011F  06                push es
00000120  BAD403            mov dx,0x3d4
00000123  B00E              mov al,0xe
00000125  EE                out dx,al
00000126  BAD503            mov dx,0x3d5
00000129  EC                in al,dx
0000012A  88C4              mov ah,al
0000012C  BAD403            mov dx,0x3d4
0000012F  B00F              mov al,0xf
00000131  EE                out dx,al
00000132  BAD503            mov dx,0x3d5
00000135  EC                in al,dx
00000136  89C3              mov bx,ax
00000138  80F90D            cmp cl,0xd
0000013B  750C              jnz 0x149
0000013D  89D8              mov ax,bx
0000013F  B350              mov bl,0x50
00000141  F6F3              div bl
00000143  F6E3              mul bl
00000145  89C3              mov bx,ax
00000147  EB45              jmp short 0x18e
00000149  80F90A            cmp cl,0xa
0000014C  7505              jnz 0x153
0000014E  83C350            add bx,byte +0x50
00000151  EB0F              jmp short 0x162
00000153  B800B8            mov ax,0xb800
00000156  8EC0              mov es,ax
00000158  D1E3              shl bx,1
0000015A  26880F            mov [es:bx],cl
0000015D  D1EB              shr bx,1
0000015F  83C301            add bx,byte +0x1
00000162  81FBD007          cmp bx,0x7d0
00000166  7C26              jl 0x18e
00000168  B800B8            mov ax,0xb800
0000016B  8ED8              mov ds,ax
0000016D  8EC0              mov es,ax
0000016F  FC                cld
00000170  BEA000            mov si,0xa0
00000173  BF0000            mov di,0x0
00000176  B98007            mov cx,0x780
00000179  F3A5              rep movsw
0000017B  BB000F            mov bx,0xf00
0000017E  B95000            mov cx,0x50
00000181  26C7072007        mov word [es:bx],0x720
00000186  83C302            add bx,byte +0x2
00000189  E2F6              loop 0x181
0000018B  BB8007            mov bx,0x780
0000018E  BAD403            mov dx,0x3d4
00000191  B00E              mov al,0xe
00000193  EE                out dx,al
00000194  BAD503            mov dx,0x3d5
00000197  88F8              mov al,bh
00000199  EE                out dx,al
0000019A  BAD403            mov dx,0x3d4
0000019D  B00F              mov al,0xf
0000019F  EE                out dx,al
000001A0  BAD503            mov dx,0x3d5
000001A3  88D8              mov al,bl
000001A5  EE                out dx,al
000001A6  07                pop es
000001A7  1F                pop ds
000001A8  5A                pop dx
000001A9  59                pop cx
000001AA  5B                pop bx
000001AB  58                pop ax
000001AC  C3                ret
000001AD  0000              add [bx+si],al
000001AF  005374            add [bp+di+0x74],dl
000001B2  61                popaw
000001B3  7274              jc 0x229
000001B5  696E672E2E        imul bp,[bp+0x67],word 0x2e2e
000001BA  2E0D0A00          cs or ax,0xa
000001BE  49                dec cx
000001BF  6E                outsb
000001C0  7374              jnc 0x236
000001C2  61                popaw
000001C3  6C                insb
000001C4  6C                insb
000001C5  696E672061        imul bp,[bp+0x67],word 0x6120
000001CA  206E65            and [bp+0x65],ch
000001CD  7720              ja 0x1ef
000001CF  696E746572        imul bp,[bp+0x74],word 0x7265
000001D4  7275              jc 0x24b
000001D6  7074              jo 0x24c
000001D8  2037              and [bx],dh
000001DA  30482E            xor [bx+si+0x2e],cl
000001DD  2E2E00446F        add [cs:si+0x6f],al
000001E2  6E                outsb
000001E3  652E0D0A00        cs or ax,0xa
000001E8  43                inc bx
000001E9  6C                insb
000001EA  6F                outsw
000001EB  636B20            arpl [bp+di+0x20],bp
000001EE  6973206E6F        imul si,[bp+di+0x20],word 0x6f6e
000001F3  7720              ja 0x215
000001F5  776F              ja 0x266
000001F7  726B              jc 0x264
000001F9  696E672E00        imul bp,[bp+0x67],word 0x2e
000001FE  0000              add [bx+si],al
00000200  0000              add [bx+si],al
00000202  0000              add [bx+si],al
00000204  0000              add [bx+si],al
00000206  0000              add [bx+si],al
00000208  0000              add [bx+si],al
0000020A  0000              add [bx+si],al
0000020C  0000              add [bx+si],al
0000020E  0000              add [bx+si],al
00000210  0000              add [bx+si],al
00000212  0000              add [bx+si],al
00000214  0000              add [bx+si],al
00000216  0000              add [bx+si],al
00000218  0000              add [bx+si],al
0000021A  0000              add [bx+si],al
0000021C  0000              add [bx+si],al
0000021E  0000              add [bx+si],al
00000220  0000              add [bx+si],al
00000222  0000              add [bx+si],al
00000224  0000              add [bx+si],al
00000226  0000              add [bx+si],al
00000228  0000              add [bx+si],al
0000022A  0000              add [bx+si],al
0000022C  0000              add [bx+si],al
0000022E  0000              add [bx+si],al
00000230  0000              add [bx+si],al
00000232  0000              add [bx+si],al
00000234  0000              add [bx+si],al
00000236  0000              add [bx+si],al
00000238  0000              add [bx+si],al
0000023A  0000              add [bx+si],al
0000023C  0000              add [bx+si],al
0000023E  0000              add [bx+si],al
00000240  0000              add [bx+si],al
00000242  0000              add [bx+si],al
00000244  0000              add [bx+si],al
00000246  0000              add [bx+si],al
00000248  0000              add [bx+si],al
0000024A  0000              add [bx+si],al
0000024C  0000              add [bx+si],al
0000024E  0000              add [bx+si],al
00000250  0000              add [bx+si],al
00000252  0000              add [bx+si],al
00000254  0000              add [bx+si],al
00000256  0000              add [bx+si],al
00000258  0000              add [bx+si],al
0000025A  0000              add [bx+si],al
0000025C  0000              add [bx+si],al
0000025E  0000              add [bx+si],al
00000260  0000              add [bx+si],al
00000262  0000              add [bx+si],al
00000264  0000              add [bx+si],al
00000266  0000              add [bx+si],al
00000268  0000              add [bx+si],al
0000026A  0000              add [bx+si],al
0000026C  0000              add [bx+si],al
0000026E  0000              add [bx+si],al
00000270  0000              add [bx+si],al
00000272  0000              add [bx+si],al
00000274  0000              add [bx+si],al
00000276  0000              add [bx+si],al
00000278  0000              add [bx+si],al
0000027A  0000              add [bx+si],al
0000027C  0000              add [bx+si],al
0000027E  0000              add [bx+si],al
00000280  0000              add [bx+si],al
00000282  0000              add [bx+si],al
00000284  0000              add [bx+si],al
00000286  0000              add [bx+si],al
00000288  0000              add [bx+si],al
0000028A  0000              add [bx+si],al
0000028C  0000              add [bx+si],al
0000028E  0000              add [bx+si],al
00000290  0000              add [bx+si],al
00000292  0000              add [bx+si],al
00000294  0000              add [bx+si],al
00000296  0000              add [bx+si],al
00000298  0000              add [bx+si],al
0000029A  0000              add [bx+si],al
0000029C  0000              add [bx+si],al
0000029E  0000              add [bx+si],al
000002A0  0000              add [bx+si],al
000002A2  0000              add [bx+si],al
000002A4  0000              add [bx+si],al
000002A6  0000              add [bx+si],al
000002A8  0000              add [bx+si],al
000002AA  0000              add [bx+si],al
000002AC  0000              add [bx+si],al
000002AE  0000              add [bx+si],al
000002B0  0000              add [bx+si],al
000002B2  0000              add [bx+si],al
000002B4  0000              add [bx+si],al
000002B6  0000              add [bx+si],al
000002B8  0000              add [bx+si],al
000002BA  0000              add [bx+si],al
000002BC  0000              add [bx+si],al
000002BE  0000              add [bx+si],al
000002C0  0000              add [bx+si],al
000002C2  0000              add [bx+si],al
000002C4  0000              add [bx+si],al
000002C6  0000              add [bx+si],al
000002C8  0000              add [bx+si],al
000002CA  0000              add [bx+si],al
000002CC  0000              add [bx+si],al
000002CE  0000              add [bx+si],al
000002D0  0000              add [bx+si],al
000002D2  0000              add [bx+si],al
000002D4  0000              add [bx+si],al
000002D6  0000              add [bx+si],al
000002D8  0000              add [bx+si],al
000002DA  0000              add [bx+si],al
000002DC  0000              add [bx+si],al
000002DE  0000              add [bx+si],al
000002E0  0000              add [bx+si],al
000002E2  0000              add [bx+si],al
000002E4  0000              add [bx+si],al
000002E6  0000              add [bx+si],al
000002E8  0000              add [bx+si],al
000002EA  0000              add [bx+si],al
000002EC  0000              add [bx+si],al
000002EE  0000              add [bx+si],al
000002F0  0000              add [bx+si],al
000002F2  0000              add [bx+si],al
000002F4  0000              add [bx+si],al
000002F6  0000              add [bx+si],al
000002F8  0000              add [bx+si],al
000002FA  0000              add [bx+si],al
000002FC  0000              add [bx+si],al
000002FE  0000              add [bx+si],al
