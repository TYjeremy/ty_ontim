00000000  1003              adc [bp+di],al
00000002  0000              add [bx+si],al
00000004  8D00              lea ax,[bx+si]
00000006  2000              and [bx+si],al
00000008  0000              add [bx+si],al
0000000A  0300              add ax,[bx+si]
0000000C  2000              and [bx+si],al
0000000E  0000              add [bx+si],al
00000010  C00100            rol byte [bx+di],byte 0x0
00000013  0010              add [bx+si],dl
00000015  0200              add al,[bx+si]
00000017  0000              add [bx+si],al
00000019  0000              add [bx+si],al
0000001B  0000              add [bx+si],al
0000001D  0000              add [bx+si],al
0000001F  005053            add [bx+si+0x53],dl
00000022  51                push cx
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
000000BD  E85300            call word 0x113
000000C0  BB0E00            mov bx,0xe
000000C3  E84D00            call word 0x113
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
000000F9  E81700            call word 0x113
000000FC  BB3800            mov bx,0x38
000000FF  E81100            call word 0x113
00000102  B900B8            mov cx,0xb800
00000105  8ED9              mov ds,cx
00000107  C606C20740        mov byte [0x7c2],0x40
0000010C  F4                hlt
0000010D  F616C307          not byte [0x7c3]
00000111  EBF9              jmp short 0x10c
00000113  8A0F              mov cl,[bx]
00000115  08C9              or cl,cl
00000117  7406              jz 0x11f
00000119  E80400            call word 0x120
0000011C  43                inc bx
0000011D  EBF4              jmp short 0x113
0000011F  C3                ret
00000120  50                push ax
00000121  53                push bx
00000122  51                push cx
00000123  52                push dx
00000124  1E                push ds
00000125  06                push es
00000126  BAD403            mov dx,0x3d4
00000129  B00E              mov al,0xe
0000012B  EE                out dx,al
0000012C  BAD503            mov dx,0x3d5
0000012F  EC                in al,dx
00000130  88C4              mov ah,al
00000132  BAD403            mov dx,0x3d4
00000135  B00F              mov al,0xf
00000137  EE                out dx,al
00000138  BAD503            mov dx,0x3d5
0000013B  EC                in al,dx
0000013C  89C3              mov bx,ax
0000013E  80F90D            cmp cl,0xd
00000141  750C              jnz 0x14f
00000143  89D8              mov ax,bx
00000145  B350              mov bl,0x50
00000147  F6F3              div bl
00000149  F6E3              mul bl
0000014B  89C3              mov bx,ax
0000014D  EB45              jmp short 0x194
0000014F  80F90A            cmp cl,0xa
00000152  7505              jnz 0x159
00000154  83C350            add bx,byte +0x50
00000157  EB0F              jmp short 0x168
00000159  B800B8            mov ax,0xb800
0000015C  8EC0              mov es,ax
0000015E  D1E3              shl bx,1
00000160  26880F            mov [es:bx],cl
00000163  D1EB              shr bx,1
00000165  83C301            add bx,byte +0x1
00000168  81FBD007          cmp bx,0x7d0
0000016C  7C26              jl 0x194
0000016E  B800B8            mov ax,0xb800
00000171  8ED8              mov ds,ax
00000173  8EC0              mov es,ax
00000175  FC                cld
00000176  BEA000            mov si,0xa0
00000179  BF0000            mov di,0x0
0000017C  B98007            mov cx,0x780
0000017F  F3A5              rep movsw
00000181  BB000F            mov bx,0xf00
00000184  B95000            mov cx,0x50
00000187  26C7072007        mov word [es:bx],0x720
0000018C  83C302            add bx,byte +0x2
0000018F  E2F6              loop 0x187
00000191  BB8007            mov bx,0x780
00000194  BAD403            mov dx,0x3d4
00000197  B00E              mov al,0xe
00000199  EE                out dx,al
0000019A  BAD503            mov dx,0x3d5
0000019D  88F8              mov al,bh
0000019F  EE                out dx,al
000001A0  BAD403            mov dx,0x3d4
000001A3  B00F              mov al,0xf
000001A5  EE                out dx,al
000001A6  BAD503            mov dx,0x3d5
000001A9  88D8              mov al,bl
000001AB  EE                out dx,al
000001AC  07                pop es
000001AD  1F                pop ds
000001AE  5A                pop dx
000001AF  59                pop cx
000001B0  5B                pop bx
000001B1  58                pop ax
000001B2  C3                ret
000001B3  0000              add [bx+si],al
000001B5  0000              add [bx+si],al
000001B7  0000              add [bx+si],al
000001B9  0000              add [bx+si],al
000001BB  0000              add [bx+si],al
000001BD  0000              add [bx+si],al
000001BF  005374            add [bp+di+0x74],dl
000001C2  61                popaw
000001C3  7274              jc 0x239
000001C5  696E672E2E        imul bp,[bp+0x67],word 0x2e2e
000001CA  2E0D0A00          cs or ax,0xa
000001CE  49                dec cx
000001CF  6E                outsb
000001D0  7374              jnc 0x246
000001D2  61                popaw
000001D3  6C                insb
000001D4  6C                insb
000001D5  696E672061        imul bp,[bp+0x67],word 0x6120
000001DA  206E65            and [bp+0x65],ch
000001DD  7720              ja 0x1ff
000001DF  696E746572        imul bp,[bp+0x74],word 0x7265
000001E4  7275              jc 0x25b
000001E6  7074              jo 0x25c
000001E8  2037              and [bx],dh
000001EA  30482E            xor [bx+si+0x2e],cl
000001ED  2E2E00446F        add [cs:si+0x6f],al
000001F2  6E                outsb
000001F3  652E0D0A00        cs or ax,0xa
000001F8  43                inc bx
000001F9  6C                insb
000001FA  6F                outsw
000001FB  636B20            arpl [bp+di+0x20],bp
000001FE  6973206E6F        imul si,[bp+di+0x20],word 0x6f6e
00000203  7720              ja 0x225
00000205  776F              ja 0x276
00000207  726B              jc 0x274
00000209  696E672E00        imul bp,[bp+0x67],word 0x2e
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
00000300  0000              add [bx+si],al
00000302  0000              add [bx+si],al
00000304  0000              add [bx+si],al
00000306  0000              add [bx+si],al
00000308  0000              add [bx+si],al
0000030A  0000              add [bx+si],al
0000030C  0000              add [bx+si],al
0000030E  0000              add [bx+si],al
