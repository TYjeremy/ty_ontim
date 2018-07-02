00000000  C00300            rol byte [bp+di],byte 0x0
00000003  00A00020          add [bx+si+0x2000],ah
00000007  0000              add [bx+si],al
00000009  0005              add [di],al
0000000B  0020              add [bx+si],ah
0000000D  0000              add [bx+si],al
0000000F  00F0              add al,dh
00000011  0000              add [bx+si],al
00000013  0000              add [bx+si],al
00000015  0100              add [bx+si],ax
00000017  00800200          add [bx+si+0x2],al
0000001B  00C0              add al,al
0000001D  0200              add al,[bx+si]
0000001F  008A0F08          add [bp+si+0x80f],cl
00000023  C9                leave
00000024  7406              jz 0x2c
00000026  E80400            call word 0x2d
00000029  43                inc bx
0000002A  EBF4              jmp short 0x20
0000002C  C3                ret
0000002D  50                push ax
0000002E  53                push bx
0000002F  51                push cx
00000030  52                push dx
00000031  1E                push ds
00000032  06                push es
00000033  BAD403            mov dx,0x3d4
00000036  B00E              mov al,0xe
00000038  EE                out dx,al
00000039  BAD503            mov dx,0x3d5
0000003C  EC                in al,dx
0000003D  88C4              mov ah,al
0000003F  BAD403            mov dx,0x3d4
00000042  B00F              mov al,0xf
00000044  EE                out dx,al
00000045  BAD503            mov dx,0x3d5
00000048  EC                in al,dx
00000049  89C3              mov bx,ax
0000004B  80F90D            cmp cl,0xd
0000004E  750C              jnz 0x5c
00000050  89D8              mov ax,bx
00000052  B350              mov bl,0x50
00000054  F6F3              div bl
00000056  F6E3              mul bl
00000058  89C3              mov bx,ax
0000005A  EB45              jmp short 0xa1
0000005C  80F90A            cmp cl,0xa
0000005F  7505              jnz 0x66
00000061  83C350            add bx,byte +0x50
00000064  EB0F              jmp short 0x75
00000066  B800B8            mov ax,0xb800
00000069  8EC0              mov es,ax
0000006B  D1E3              shl bx,1
0000006D  26880F            mov [es:bx],cl
00000070  D1EB              shr bx,1
00000072  83C301            add bx,byte +0x1
00000075  81FBD007          cmp bx,0x7d0
00000079  7C26              jl 0xa1
0000007B  B800B8            mov ax,0xb800
0000007E  8ED8              mov ds,ax
00000080  8EC0              mov es,ax
00000082  FC                cld
00000083  BEA000            mov si,0xa0
00000086  BF0000            mov di,0x0
00000089  B98007            mov cx,0x780
0000008C  F3A5              rep movsw
0000008E  BB000F            mov bx,0xf00
00000091  B95000            mov cx,0x50
00000094  26C7072007        mov word [es:bx],0x720
00000099  83C302            add bx,byte +0x2
0000009C  E2F6              loop 0x94
0000009E  BB8007            mov bx,0x780
000000A1  BAD403            mov dx,0x3d4
000000A4  B00E              mov al,0xe
000000A6  EE                out dx,al
000000A7  BAD503            mov dx,0x3d5
000000AA  88F8              mov al,bh
000000AC  EE                out dx,al
000000AD  BAD403            mov dx,0x3d4
000000B0  B00F              mov al,0xf
000000B2  EE                out dx,al
000000B3  BAD503            mov dx,0x3d5
000000B6  88D8              mov al,bl
000000B8  EE                out dx,al
000000B9  07                pop es
000000BA  1F                pop ds
000000BB  5A                pop dx
000000BC  59                pop cx
000000BD  5B                pop bx
000000BE  58                pop ax
000000BF  C3                ret
000000C0  A11C00            mov ax,[0x1c]
000000C3  8ED0              mov ss,ax
000000C5  BC0001            mov sp,0x100
000000C8  A11400            mov ax,[0x14]
000000CB  8ED8              mov ds,ax
000000CD  BB0000            mov bx,0x0
000000D0  E84DFF            call word 0x20
000000D3  26FF361000        push word [es:0x10]
000000D8  B80000            mov ax,0x0
000000DB  50                push ax
000000DC  CB                retf
000000DD  26A11800          mov ax,[es:0x18]
000000E1  8ED8              mov ds,ax
000000E3  BB0000            mov bx,0x0
000000E6  E837FF            call word 0x20
000000E9  EBFE              jmp short 0xe9
000000EB  0000              add [bx+si],al
000000ED  0000              add [bx+si],al
000000EF  0026FF36          add [0x36ff],ah
000000F3  0C00              or al,0x0
000000F5  B8BD00            mov ax,0xbd
000000F8  50                push ax
000000F9  CB                retf
000000FA  0000              add [bx+si],al
000000FC  0000              add [bx+si],al
000000FE  0000              add [bx+si],al
00000100  2020              and [bx+si],ah
00000102  54                push sp
00000103  686973            push word 0x7369
00000106  206973            and [bx+di+0x73],ch
00000109  204E41            and [bp+0x41],cl
0000010C  53                push bx
0000010D  4D                dec bp
0000010E  202D              and [di],ch
00000110  207468            and [si+0x68],dh
00000113  65206661          and [gs:bp+0x61],ah
00000117  6D                insw
00000118  6F                outsw
00000119  7573              jnz 0x18e
0000011B  204E65            and [bp+0x65],cl
0000011E  7477              jz 0x197
00000120  6964652041        imul sp,[si+0x65],word 0x4120
00000125  7373              jnc 0x19a
00000127  656D              gs insw
00000129  626C65            bound bp,[si+0x65]
0000012C  722E              jc 0x15c
0000012E  204261            and [bp+si+0x61],al
00000131  636B20            arpl [bp+di+0x20],bp
00000134  61                popaw
00000135  7420              jz 0x157
00000137  53                push bx
00000138  6F                outsw
00000139  7572              jnz 0x1ad
0000013B  636546            arpl [di+0x46],sp
0000013E  6F                outsw
0000013F  7267              jc 0x1a8
00000141  6520616E          and [gs:bx+di+0x6e],ah
00000145  6420696E          and [fs:bx+di+0x6e],ch
00000149  20696E            and [bx+di+0x6e],ch
0000014C  7465              jz 0x1b3
0000014E  6E                outsb
0000014F  7369              jnc 0x1ba
00000151  7665              jna 0x1b8
00000153  206465            and [si+0x65],ah
00000156  7665              jna 0x1bd
00000158  6C                insb
00000159  6F                outsw
0000015A  706D              jo 0x1c9
0000015C  656E              gs outsb
0000015E  7421              jz 0x181
00000160  204765            and [bx+0x65],al
00000163  7420              jz 0x185
00000165  7468              jz 0x1cf
00000167  65206375          and [gs:bp+di+0x75],ah
0000016B  7272              jc 0x1df
0000016D  656E              gs outsb
0000016F  7420              jz 0x191
00000171  7665              jna 0x1d8
00000173  7273              jc 0x1e8
00000175  696F6E7320        imul bp,[bx+0x6e],word 0x2073
0000017A  66726F            o32 jc 0x1ec
0000017D  6D                insw
0000017E  206874            and [bx+si+0x74],ch
00000181  7470              jz 0x1f3
00000183  3A2F              cmp ch,[bx]
00000185  2F                das
00000186  7777              ja 0x1ff
00000188  772E              ja 0x1b8
0000018A  6E                outsb
0000018B  61                popaw
0000018C  736D              jnc 0x1fb
0000018E  2E7573            cs jnz 0x204
00000191  2F                das
00000192  2E0D0A0D          cs or ax,0xd0a
00000196  0A20              or ah,[bx+si]
00000198  204578            and [di+0x78],al
0000019B  61                popaw
0000019C  6D                insw
0000019D  706C              jo 0x20b
0000019F  6520636F          and [gs:bp+di+0x6f],ah
000001A3  646520666F        and [gs:bp+0x6f],ah
000001A8  7220              jc 0x1ca
000001AA  63616C            arpl [bx+di+0x6c],sp
000001AD  63756C            arpl [di+0x6c],si
000001B0  61                popaw
000001B1  7465              jz 0x218
000001B3  2031              and [bx+di],dh
000001B5  2B32              sub si,[bp+si]
000001B7  2B2E2E2E          sub bp,[0x2e2e]
000001BB  2B31              sub si,[bx+di]
000001BD  3030              xor [bx+si],dh
000001BF  303A              xor [bp+si],bh
000001C1  0D0A0D            or ax,0xd0a
000001C4  0A20              or ah,[bx+si]
000001C6  2020              and [bx+si],ah
000001C8  2020              and [bx+si],ah
000001CA  786F              js 0x23b
000001CC  7220              jc 0x1ee
000001CE  64782C            fs js 0x1fd
000001D1  64780D            fs js 0x1e1
000001D4  0A20              or ah,[bx+si]
000001D6  2020              and [bx+si],ah
000001D8  2020              and [bx+si],ah
000001DA  786F              js 0x24b
000001DC  7220              jc 0x1fe
000001DE  61                popaw
000001DF  782C              js 0x20d
000001E1  61                popaw
000001E2  780D              js 0x1f1
000001E4  0A20              or ah,[bx+si]
000001E6  2020              and [bx+si],ah
000001E8  2020              and [bx+si],ah
000001EA  786F              js 0x25b
000001EC  7220              jc 0x20e
000001EE  63782C            arpl [bx+si+0x2c],di
000001F1  63780D            arpl [bx+si+0xd],di
000001F4  0A20              or ah,[bx+si]
000001F6  204040            and [bx+si+0x40],al
000001F9  3A0D              cmp cl,[di]
000001FB  0A20              or ah,[bx+si]
000001FD  2020              and [bx+si],ah
000001FF  2020              and [bx+si],ah
00000201  696E632063        imul bp,[bp+0x63],word 0x6320
00000206  780D              js 0x215
00000208  0A20              or ah,[bx+si]
0000020A  2020              and [bx+si],ah
0000020C  2020              and [bx+si],ah
0000020E  61                popaw
0000020F  6464206178        and [fs:bx+di+0x78],ah
00000214  2C63              sub al,0x63
00000216  780D              js 0x225
00000218  0A20              or ah,[bx+si]
0000021A  2020              and [bx+si],ah
0000021C  2020              and [bx+si],ah
0000021E  61                popaw
0000021F  646320            arpl [fs:bx+si],sp
00000222  64782C            fs js 0x251
00000225  300D              xor [di],cl
00000227  0A20              or ah,[bx+si]
00000229  2020              and [bx+si],ah
0000022B  2020              and [bx+si],ah
0000022D  696E632063        imul bp,[bp+0x63],word 0x6320
00000232  780D              js 0x241
00000234  0A20              or ah,[bx+si]
00000236  2020              and [bx+si],ah
00000238  2020              and [bx+si],ah
0000023A  636D70            arpl [di+0x70],bp
0000023D  206378            and [bp+di+0x78],ah
00000240  2C31              sub al,0x31
00000242  3030              xor [bx+si],dh
00000244  300D              xor [di],cl
00000246  0A20              or ah,[bx+si]
00000248  2020              and [bx+si],ah
0000024A  2020              and [bx+si],ah
0000024C  6A6C              push byte +0x6c
0000024E  65204040          and [gs:bx+si+0x40],al
00000252  0D0A20            or ax,0x200a
00000255  2020              and [bx+si],ah
00000257  2020              and [bx+si],ah
00000259  2E2E2E202E2E2E    and [cs:0x2e2e],ch
00000260  28536F            sub [bp+di+0x6f],dl
00000263  6D                insw
00000264  65206F74          and [gs:bx+0x74],ch
00000268  686572            push word 0x7265
0000026B  20636F            and [bp+di+0x6f],ah
0000026E  64657329          gs jnc 0x29b
00000272  0D0A0D            or ax,0xd0a
00000275  0A00              or al,[bx+si]
00000277  0000              add [bx+si],al
00000279  0000              add [bx+si],al
0000027B  0000              add [bx+si],al
0000027D  0000              add [bx+si],al
0000027F  0020              add [bx+si],ah
00000281  205468            and [si+0x68],dl
00000284  65206162          and [gs:bx+di+0x62],ah
00000288  6F                outsw
00000289  7665              jna 0x2f0
0000028B  20636F            and [bp+di+0x6f],ah
0000028E  6E                outsb
0000028F  7465              jz 0x2f6
00000291  6E                outsb
00000292  7473              jz 0x307
00000294  206973            and [bx+di+0x73],ch
00000297  207772            and [bx+0x72],dh
0000029A  697474656E        imul si,[si+0x74],word 0x6e65
0000029F  206279            and [bp+si+0x79],ah
000002A2  204C65            and [si+0x65],cl
000002A5  6543              gs inc bx
000002A7  68756E            push word 0x6e75
000002AA  672E2032          and [cs:edx],dh
000002AE  3031              xor [bx+di],dh
000002B0  312D              xor [di],bp
000002B2  3035              xor [di],dh
000002B4  2D3036            sub ax,0x3630
000002B7  0000              add [bx+si],al
000002B9  0000              add [bx+si],al
000002BB  0000              add [bx+si],al
000002BD  0000              add [bx+si],al
000002BF  0000              add [bx+si],al
000002C1  0000              add [bx+si],al
000002C3  0000              add [bx+si],al
000002C5  0000              add [bx+si],al
000002C7  0000              add [bx+si],al
000002C9  0000              add [bx+si],al
000002CB  0000              add [bx+si],al
000002CD  0000              add [bx+si],al
000002CF  0000              add [bx+si],al
000002D1  0000              add [bx+si],al
000002D3  0000              add [bx+si],al
000002D5  0000              add [bx+si],al
000002D7  0000              add [bx+si],al
000002D9  0000              add [bx+si],al
000002DB  0000              add [bx+si],al
000002DD  0000              add [bx+si],al
000002DF  0000              add [bx+si],al
000002E1  0000              add [bx+si],al
000002E3  0000              add [bx+si],al
000002E5  0000              add [bx+si],al
000002E7  0000              add [bx+si],al
000002E9  0000              add [bx+si],al
000002EB  0000              add [bx+si],al
000002ED  0000              add [bx+si],al
000002EF  0000              add [bx+si],al
000002F1  0000              add [bx+si],al
000002F3  0000              add [bx+si],al
000002F5  0000              add [bx+si],al
000002F7  0000              add [bx+si],al
000002F9  0000              add [bx+si],al
000002FB  0000              add [bx+si],al
000002FD  0000              add [bx+si],al
000002FF  0000              add [bx+si],al
00000301  0000              add [bx+si],al
00000303  0000              add [bx+si],al
00000305  0000              add [bx+si],al
00000307  0000              add [bx+si],al
00000309  0000              add [bx+si],al
0000030B  0000              add [bx+si],al
0000030D  0000              add [bx+si],al
0000030F  0000              add [bx+si],al
00000311  0000              add [bx+si],al
00000313  0000              add [bx+si],al
00000315  0000              add [bx+si],al
00000317  0000              add [bx+si],al
00000319  0000              add [bx+si],al
0000031B  0000              add [bx+si],al
0000031D  0000              add [bx+si],al
0000031F  0000              add [bx+si],al
00000321  0000              add [bx+si],al
00000323  0000              add [bx+si],al
00000325  0000              add [bx+si],al
00000327  0000              add [bx+si],al
00000329  0000              add [bx+si],al
0000032B  0000              add [bx+si],al
0000032D  0000              add [bx+si],al
0000032F  0000              add [bx+si],al
00000331  0000              add [bx+si],al
00000333  0000              add [bx+si],al
00000335  0000              add [bx+si],al
00000337  0000              add [bx+si],al
00000339  0000              add [bx+si],al
0000033B  0000              add [bx+si],al
0000033D  0000              add [bx+si],al
0000033F  0000              add [bx+si],al
00000341  0000              add [bx+si],al
00000343  0000              add [bx+si],al
00000345  0000              add [bx+si],al
00000347  0000              add [bx+si],al
00000349  0000              add [bx+si],al
0000034B  0000              add [bx+si],al
0000034D  0000              add [bx+si],al
0000034F  0000              add [bx+si],al
00000351  0000              add [bx+si],al
00000353  0000              add [bx+si],al
00000355  0000              add [bx+si],al
00000357  0000              add [bx+si],al
00000359  0000              add [bx+si],al
0000035B  0000              add [bx+si],al
0000035D  0000              add [bx+si],al
0000035F  0000              add [bx+si],al
00000361  0000              add [bx+si],al
00000363  0000              add [bx+si],al
00000365  0000              add [bx+si],al
00000367  0000              add [bx+si],al
00000369  0000              add [bx+si],al
0000036B  0000              add [bx+si],al
0000036D  0000              add [bx+si],al
0000036F  0000              add [bx+si],al
00000371  0000              add [bx+si],al
00000373  0000              add [bx+si],al
00000375  0000              add [bx+si],al
00000377  0000              add [bx+si],al
00000379  0000              add [bx+si],al
0000037B  0000              add [bx+si],al
0000037D  0000              add [bx+si],al
0000037F  0000              add [bx+si],al
00000381  0000              add [bx+si],al
00000383  0000              add [bx+si],al
00000385  0000              add [bx+si],al
00000387  0000              add [bx+si],al
00000389  0000              add [bx+si],al
0000038B  0000              add [bx+si],al
0000038D  0000              add [bx+si],al
0000038F  0000              add [bx+si],al
00000391  0000              add [bx+si],al
00000393  0000              add [bx+si],al
00000395  0000              add [bx+si],al
00000397  0000              add [bx+si],al
00000399  0000              add [bx+si],al
0000039B  0000              add [bx+si],al
0000039D  0000              add [bx+si],al
0000039F  0000              add [bx+si],al
000003A1  0000              add [bx+si],al
000003A3  0000              add [bx+si],al
000003A5  0000              add [bx+si],al
000003A7  0000              add [bx+si],al
000003A9  0000              add [bx+si],al
000003AB  0000              add [bx+si],al
000003AD  0000              add [bx+si],al
000003AF  0000              add [bx+si],al
000003B1  0000              add [bx+si],al
000003B3  0000              add [bx+si],al
000003B5  0000              add [bx+si],al
000003B7  0000              add [bx+si],al
000003B9  0000              add [bx+si],al
000003BB  0000              add [bx+si],al
000003BD  0000              add [bx+si],al
000003BF  00                db 0x00
