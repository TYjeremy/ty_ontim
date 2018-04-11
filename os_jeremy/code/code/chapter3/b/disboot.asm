00007C00  E99D02            jmp word 0x7ea0
00007C03  0000              add [bx+si],al
00007C05  0000              add [bx+si],al
00007C07  0000              add [bx+si],al
00007C09  0000              add [bx+si],al
00007C0B  00FF              add bh,bh
00007C0D  FF00              inc word [bx+si]
00007C0F  0000              add [bx+si],al
00007C11  92                xchg ax,dx
00007C12  0000              add [bx+si],al
00007C14  CC                int3
00007C15  0000              add [bx+si],al
00007C17  0000              add [bx+si],al
00007C19  98                cbw
00007C1A  40                inc ax
00007C1B  00FF              add bh,bh
00007C1D  FF00              inc word [bx+si]
00007C1F  0000              add [bx+si],al
00007C21  98                cbw
00007C22  0000              add [bx+si],al
00007C24  350000            xor ax,0x0
00007C27  0000              add [bx+si],al
00007C29  92                xchg ax,dx
00007C2A  0000              add [bx+si],al
00007C2C  FF01              inc word [bx+di]
00007C2E  0000              add [bx+si],al
00007C30  00934000          add [bp+di+0x40],dl
00007C34  FF                db 0xff
00007C35  FF00              inc word [bx+si]
00007C37  005092            add [bx+si-0x6e],dl
00007C3A  0000              add [bx+si],al
00007C3C  FF                db 0xff
00007C3D  FF00              inc word [bx+si]
00007C3F  800B92            or byte [bp+di],0x92
00007C42  0000              add [bx+si],al
00007C44  3F                aas
00007C45  0000              add [bx+si],al
00007C47  0000              add [bx+si],al
00007C49  0000              add [bx+si],al
00007C4B  0000              add [bx+si],al
00007C4D  0000              add [bx+si],al
00007C4F  0000              add [bx+si],al
00007C51  0000              add [bx+si],al
00007C53  0000              add [bx+si],al
00007C55  0000              add [bx+si],al
00007C57  0000              add [bx+si],al
00007C59  0000              add [bx+si],al
00007C5B  0000              add [bx+si],al
00007C5D  0000              add [bx+si],al
00007C5F  0000              add [bx+si],al
00007C61  00496E            add [bx+di+0x6e],cl
00007C64  205072            and [bx+si+0x72],dl
00007C67  6F                outsw
00007C68  7465              jz 0x7ccf
00007C6A  637420            arpl [si+0x20],si
00007C6D  4D                dec bp
00007C6E  6F                outsw
00007C6F  6465206E6F        and [gs:bp+0x6f],ch
00007C74  772E              ja 0x7ca4
00007C76  205E2D            and [bp+0x2d],bl
00007C79  5E                pop si
00007C7A  004142            add [bx+di+0x42],al
00007C7D  43                inc bx
00007C7E  44                inc sp
00007C7F  45                inc bp
00007C80  46                inc si
00007C81  47                inc di
00007C82  48                dec ax
00007C83  49                dec cx
00007C84  4A                dec dx
00007C85  4B                dec bx
00007C86  4C                dec sp
00007C87  4D                dec bp
00007C88  4E                dec si
00007C89  4F                dec di
00007C8A  50                push ax
00007C8B  51                push cx
00007C8C  52                push dx
00007C8D  53                push bx
00007C8E  54                push sp
00007C8F  55                push bp
00007C90  56                push si
00007C91  57                push di
00007C92  58                pop ax
00007C93  59                pop cx
00007C94  5A                pop dx
00007C95  0000              add [bx+si],al
00007C97  0000              add [bx+si],al
00007C99  0000              add [bx+si],al
00007C9B  0000              add [bx+si],al
00007C9D  0000              add [bx+si],al
00007C9F  0000              add [bx+si],al
00007CA1  0000              add [bx+si],al
00007CA3  0000              add [bx+si],al
00007CA5  0000              add [bx+si],al
00007CA7  0000              add [bx+si],al
00007CA9  0000              add [bx+si],al
00007CAB  0000              add [bx+si],al
00007CAD  0000              add [bx+si],al
00007CAF  0000              add [bx+si],al
00007CB1  0000              add [bx+si],al
00007CB3  0000              add [bx+si],al
00007CB5  0000              add [bx+si],al
00007CB7  0000              add [bx+si],al
00007CB9  0000              add [bx+si],al
00007CBB  0000              add [bx+si],al
00007CBD  0000              add [bx+si],al
00007CBF  0000              add [bx+si],al
00007CC1  0000              add [bx+si],al
00007CC3  0000              add [bx+si],al
00007CC5  0000              add [bx+si],al
00007CC7  0000              add [bx+si],al
00007CC9  0000              add [bx+si],al
00007CCB  0000              add [bx+si],al
00007CCD  0000              add [bx+si],al
00007CCF  0000              add [bx+si],al
00007CD1  0000              add [bx+si],al
00007CD3  0000              add [bx+si],al
00007CD5  0000              add [bx+si],al
00007CD7  0000              add [bx+si],al
00007CD9  0000              add [bx+si],al
00007CDB  0000              add [bx+si],al
00007CDD  0000              add [bx+si],al
00007CDF  0000              add [bx+si],al
00007CE1  0000              add [bx+si],al
00007CE3  0000              add [bx+si],al
00007CE5  0000              add [bx+si],al
00007CE7  0000              add [bx+si],al
00007CE9  0000              add [bx+si],al
00007CEB  0000              add [bx+si],al
00007CED  0000              add [bx+si],al
00007CEF  0000              add [bx+si],al
00007CF1  0000              add [bx+si],al
00007CF3  0000              add [bx+si],al
00007CF5  0000              add [bx+si],al
00007CF7  0000              add [bx+si],al
00007CF9  0000              add [bx+si],al
00007CFB  0000              add [bx+si],al
00007CFD  0000              add [bx+si],al
00007CFF  0000              add [bx+si],al
00007D01  0000              add [bx+si],al
00007D03  0000              add [bx+si],al
00007D05  0000              add [bx+si],al
00007D07  0000              add [bx+si],al
00007D09  0000              add [bx+si],al
00007D0B  0000              add [bx+si],al
00007D0D  0000              add [bx+si],al
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
00007DFD  0000              add [bx+si],al
00007DFF  0000              add [bx+si],al
00007E01  0000              add [bx+si],al
00007E03  0000              add [bx+si],al
00007E05  0000              add [bx+si],al
00007E07  0000              add [bx+si],al
00007E09  0000              add [bx+si],al
00007E0B  0000              add [bx+si],al
00007E0D  0000              add [bx+si],al
00007E0F  0000              add [bx+si],al
00007E11  0000              add [bx+si],al
00007E13  0000              add [bx+si],al
00007E15  0000              add [bx+si],al
00007E17  0000              add [bx+si],al
00007E19  0000              add [bx+si],al
00007E1B  0000              add [bx+si],al
00007E1D  0000              add [bx+si],al
00007E1F  0000              add [bx+si],al
00007E21  0000              add [bx+si],al
00007E23  0000              add [bx+si],al
00007E25  0000              add [bx+si],al
00007E27  0000              add [bx+si],al
00007E29  0000              add [bx+si],al
00007E2B  0000              add [bx+si],al
00007E2D  0000              add [bx+si],al
00007E2F  0000              add [bx+si],al
00007E31  0000              add [bx+si],al
00007E33  0000              add [bx+si],al
00007E35  0000              add [bx+si],al
00007E37  0000              add [bx+si],al
00007E39  0000              add [bx+si],al
00007E3B  0000              add [bx+si],al
00007E3D  0000              add [bx+si],al
00007E3F  0000              add [bx+si],al
00007E41  0000              add [bx+si],al
00007E43  0000              add [bx+si],al
00007E45  0000              add [bx+si],al
00007E47  0000              add [bx+si],al
00007E49  0000              add [bx+si],al
00007E4B  0000              add [bx+si],al
00007E4D  0000              add [bx+si],al
00007E4F  0000              add [bx+si],al
00007E51  0000              add [bx+si],al
00007E53  0000              add [bx+si],al
00007E55  0000              add [bx+si],al
00007E57  0000              add [bx+si],al
00007E59  0000              add [bx+si],al
00007E5B  0000              add [bx+si],al
00007E5D  0000              add [bx+si],al
00007E5F  0000              add [bx+si],al
00007E61  0000              add [bx+si],al
00007E63  0000              add [bx+si],al
00007E65  0000              add [bx+si],al
00007E67  0000              add [bx+si],al
00007E69  0000              add [bx+si],al
00007E6B  0000              add [bx+si],al
00007E6D  0000              add [bx+si],al
00007E6F  0000              add [bx+si],al
00007E71  0000              add [bx+si],al
00007E73  0000              add [bx+si],al
00007E75  0000              add [bx+si],al
00007E77  0000              add [bx+si],al
00007E79  0000              add [bx+si],al
00007E7B  0000              add [bx+si],al
00007E7D  0000              add [bx+si],al
00007E7F  0000              add [bx+si],al
00007E81  0000              add [bx+si],al
00007E83  0000              add [bx+si],al
00007E85  0000              add [bx+si],al
00007E87  0000              add [bx+si],al
00007E89  0000              add [bx+si],al
00007E8B  0000              add [bx+si],al
00007E8D  0000              add [bx+si],al
00007E8F  0000              add [bx+si],al
00007E91  0000              add [bx+si],al
00007E93  0000              add [bx+si],al
00007E95  0000              add [bx+si],al
00007E97  0000              add [bx+si],al
00007E99  0000              add [bx+si],al
00007E9B  0000              add [bx+si],al
00007E9D  0000              add [bx+si],al
00007E9F  008CC88E          add [si-0x7138],cl
00007EA3  D88EC08E          fmul dword [bp-0x7140]
00007EA7  D0BC0001          sar byte [si+0x100],1
00007EAB  A35805            mov [0x558],ax
00007EAE  89266001          mov [0x160],sp
00007EB2  8CC8              mov ax,cs
00007EB4  660FB7C0          movzx eax,ax
00007EB8  66C1E004          shl eax,byte 0x4
00007EBC  660540050000      add eax,0x540
00007EC2  A31E01            mov [0x11e],ax
00007EC5  66C1E810          shr eax,byte 0x10
00007EC9  A22001            mov [0x120],al
00007ECC  88262301          mov [0x123],ah
00007ED0  6631C0            xor eax,eax
00007ED3  8CC8              mov ax,cs
00007ED5  66C1E004          shl eax,byte 0x4
00007ED9  660570040000      add eax,0x470
00007EDF  A31601            mov [0x116],ax
00007EE2  66C1E810          shr eax,byte 0x10
00007EE6  A21801            mov [0x118],al
00007EE9  88261B01          mov [0x11b],ah
00007EED  6631C0            xor eax,eax
00007EF0  8CD8              mov ax,ds
00007EF2  66C1E004          shl eax,byte 0x4
00007EF6  660560010000      add eax,0x160
00007EFC  A32601            mov [0x126],ax
00007EFF  66C1E810          shr eax,byte 0x10
00007F03  A22801            mov [0x128],al
00007F06  88262B01          mov [0x12b],ah
00007F0A  6631C0            xor eax,eax
00007F0D  8CD8              mov ax,ds
00007F0F  66C1E004          shl eax,byte 0x4
00007F13  6605A0010000      add eax,0x1a0
00007F19  A32E01            mov [0x12e],ax
00007F1C  66C1E810          shr eax,byte 0x10
00007F20  A23001            mov [0x130],al
00007F23  88263301          mov [0x133],ah
00007F27  6631C0            xor eax,eax
00007F2A  8CD8              mov ax,ds
00007F2C  66C1E004          shl eax,byte 0x4
00007F30  660504010000      add eax,0x104
00007F36  66A34601          mov [0x146],eax
00007F3A  0F01164401        lgdt [0x144]
00007F3F  FA                cli
00007F40  E492              in al,0x92
00007F42  0C02              or al,0x2
00007F44  E692              out 0x92,al
00007F46  0F20C0            mov eax,cr0
00007F49  6683C801          or eax,byte +0x1
00007F4D  0F22C0            mov cr0,eax
00007F50  66EA000000001000  jmp dword 0x10:0x0
00007F58  8CC8              mov ax,cs
00007F5A  8ED8              mov ds,ax
00007F5C  8EC0              mov es,ax
00007F5E  8ED0              mov ss,ax
00007F60  8B266001          mov sp,[0x160]
00007F64  E492              in al,0x92
00007F66  24FD              and al,0xfd
00007F68  E692              out 0x92,al
00007F6A  FB                sti
00007F6B  B8004C            mov ax,0x4c00
00007F6E  CD21              int 0x21
00007F70  66B820008ED8      mov eax,0xd88e0020
00007F76  66B830008EC0      mov eax,0xc08e0030
00007F7C  66B838008EE8      mov eax,0xe88e0038
00007F82  66B828008ED0      mov eax,0xd08e0028
00007F88  BCFF01            mov sp,0x1ff
00007F8B  0000              add [bx+si],al
00007F8D  B40C              mov ah,0xc
00007F8F  31F6              xor si,si
00007F91  31FF              xor di,di
00007F93  BE0200            mov si,0x2
00007F96  0000              add [bx+si],al
00007F98  BF4006            mov di,0x640
00007F9B  0000              add [bx+si],al
00007F9D  FC                cld
00007F9E  AC                lodsb
00007F9F  84C0              test al,al
00007FA1  7409              jz 0x7fac
00007FA3  65668907          mov [gs:bx],eax
00007FA7  83C702            add di,byte +0x2
00007FAA  EBF2              jmp short 0x7f9e
00007FAC  E87500            call word 0x8024
00007FAF  0000              add [bx+si],al
00007FB1  E81100            call word 0x7fc5
00007FB4  0000              add [bx+si],al
00007FB6  E82400            call word 0x7fdd
00007FB9  0000              add [bx+si],al
00007FBB  E80700            call word 0x7fc5
00007FBE  0000              add [bx+si],al
00007FC0  EA00000000        jmp word 0x0:0x0
00007FC5  1800              sbb [bx+si],al
00007FC7  31F6              xor si,si
00007FC9  B90800            mov cx,0x8
00007FCC  0000              add [bx+si],al
00007FCE  268A06E823        mov al,[es:0x23e8]
00007FD3  0000              add [bx+si],al
00007FD5  0046E2            add [bp-0x1e],al
00007FD8  F5                cmc
00007FD9  E84800            call word 0x8024
00007FDC  0000              add [bx+si],al
00007FDE  C3                ret
00007FDF  56                push si
00007FE0  57                push di
00007FE1  31F6              xor si,si
00007FE3  31FF              xor di,di
00007FE5  BE1B00            mov si,0x1b
00007FE8  0000              add [bx+si],al
00007FEA  FC                cld
00007FEB  AC                lodsb
00007FEC  84C0              test al,al
00007FEE  7406              jz 0x7ff6
00007FF0  268807            mov [es:bx],al
00007FF3  47                inc di
00007FF4  EBF5              jmp short 0x7feb
00007FF6  5F                pop di
00007FF7  5E                pop si
00007FF8  C3                ret
00007FF9  51                push cx
00007FFA  52                push dx
00007FFB  B40C              mov ah,0xc
00007FFD  88C2              mov dl,al
00007FFF  C0E804            shr al,byte 0x4
00008002  B90200            mov cx,0x2
00008005  0000              add [bx+si],al
00008007  240F              and al,0xf
00008009  3C09              cmp al,0x9
0000800B  7704              ja 0x8011
0000800D  0430              add al,0x30
0000800F  EB04              jmp short 0x8015
00008011  2C0A              sub al,0xa
00008013  0441              add al,0x41
00008015  65668907          mov [gs:bx],eax
00008019  83C702            add di,byte +0x2
0000801C  88D0              mov al,dl
0000801E  E2E7              loop 0x8007
00008020  83C702            add di,byte +0x2
00008023  5A                pop dx
00008024  59                pop cx
00008025  C3                ret
00008026  50                push ax
00008027  53                push bx
00008028  89F8              mov ax,di
0000802A  B3A0              mov bl,0xa0
0000802C  F6F3              div bl
0000802E  25FF00            and ax,0xff
00008031  0000              add [bx+si],al
00008033  40                inc ax
00008034  B3A0              mov bl,0xa0
00008036  F6E3              mul bl
00008038  89C7              mov di,ax
0000803A  5B                pop bx
0000803B  58                pop ax
0000803C  C3                ret
0000803D  0000              add [bx+si],al
0000803F  00B80800          add [bx+si+0x8],bh
00008043  8ED8              mov ds,ax
00008045  8EC0              mov es,ax
00008047  8EE0              mov fs,ax
00008049  8EE8              mov gs,ax
0000804B  8ED0              mov ss,ax
0000804D  0F20C0            mov eax,cr0
00008050  24FE              and al,0xfe
00008052  0F22C0            mov cr0,eax
00008055  EA58040000        jmp word 0x0:0x458
