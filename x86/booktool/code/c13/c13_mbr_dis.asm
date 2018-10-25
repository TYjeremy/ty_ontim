00000000  8CC8              mov ax,cs
00000002  8ED0              mov ss,ax
00000004  BC007C            mov sp,0x7c00
00000007  2E66A19B7D        mov eax,[cs:0x7d9b]
0000000C  6631D2            xor edx,edx
0000000F  66BB10000000      mov ebx,0x10
00000015  66F7F3            div ebx
00000018  8ED8              mov ds,ax
0000001A  6689D3            mov ebx,edx
0000001D  6667C74308FFFF00  mov dword [ebx+0x8],0xffff
         -00
00000026  6667C7430C0092CF  mov dword [ebx+0xc],0xcf9200
         -00
0000002F  6667C74310FF0100  mov dword [ebx+0x10],0x7c0001ff
         -7C
00000038  6667C74314009840  mov dword [ebx+0x14],0x409800
         -00
00000041  6667C74318FEFF00  mov dword [ebx+0x18],0x7c00fffe
         -7C
0000004A  6667C7431C0096CF  mov dword [ebx+0x1c],0xcf9600
         -00
00000053  6667C74320FF7F00  mov dword [ebx+0x20],0x80007fff
         -80
0000005C  6667C743240B9240  mov dword [ebx+0x24],0x40920b
         -00
00000065  2EC706997D2700    mov word [cs:0x7d99],0x27
0000006C  2E0F0116997D      lgdt [cs:0x7d99]
00000072  E492              in al,0x92
00000074  0C02              or al,0x2
00000076  E692              out 0x92,al
00000078  FA                cli
00000079  0F20C0            mov eax,cr0
0000007C  6683C801          or eax,byte +0x1
00000080  0F22C0            mov cr0,eax
00000083  66EA8B0000001000  jmp dword 0x10:0x8b
0000008B  B80800            mov ax,0x8
0000008E  0000              add [bx+si],al
00000090  8ED8              mov ds,ax
00000092  B81800            mov ax,0x18
00000095  0000              add [bx+si],al
00000097  8ED0              mov ss,ax
00000099  31E4              xor sp,sp
0000009B  BF0000            mov di,0x0
0000009E  0400              add al,0x0
000000A0  B80100            mov ax,0x1
000000A3  0000              add [bx+si],al
000000A5  89FB              mov bx,di
000000A7  E88D00            call word 0x137
000000AA  0000              add [bx+si],al
000000AC  8B07              mov ax,[bx]
000000AE  31D2              xor dx,dx
000000B0  B90002            mov cx,0x200
000000B3  0000              add [bx+si],al
000000B5  F7F1              div cx
000000B7  09D2              or dx,dx
000000B9  7501              jnz 0xbc
000000BB  48                dec ax
000000BC  09C0              or ax,ax
000000BE  7410              jz 0xd0
000000C0  89C1              mov cx,ax
000000C2  B80100            mov ax,0x1
000000C5  0000              add [bx+si],al
000000C7  40                inc ax
000000C8  E86C00            call word 0x137
000000CB  0000              add [bx+si],al
000000CD  40                inc ax
000000CE  E2F8              loop 0xc8
000000D0  8B35              mov si,[di]
000000D2  9B7D00            wait jnl 0xd5
000000D5  008B4704          add [bp+di+0x447],cl
000000D9  8B5F08            mov bx,[bx+0x8]
000000DC  29C3              sub bx,ax
000000DE  4B                dec bx
000000DF  01F8              add ax,di
000000E1  B90098            mov cx,0x9800
000000E4  40                inc ax
000000E5  00E8              add al,ch
000000E7  93                xchg ax,bx
000000E8  0000              add [bx+si],al
000000EA  00894628          add [bx+di+0x2846],cl
000000EE  89562C            mov [bp+0x2c],dx
000000F1  8B4708            mov ax,[bx+0x8]
000000F4  8B5F0C            mov bx,[bx+0xc]
000000F7  29C3              sub bx,ax
000000F9  4B                dec bx
000000FA  01F8              add ax,di
000000FC  B90092            mov cx,0x9200
000000FF  40                inc ax
00000100  00E8              add al,ch
00000102  7800              js 0x104
00000104  0000              add [bx+si],al
00000106  894630            mov [bp+0x30],ax
00000109  895634            mov [bp+0x34],dx
0000010C  8B470C            mov ax,[bx+0xc]
0000010F  8B1F              mov bx,[bx]
00000111  29C3              sub bx,ax
00000113  4B                dec bx
00000114  01F8              add ax,di
00000116  B90098            mov cx,0x9800
00000119  40                inc ax
0000011A  00E8              add al,ch
0000011C  5E                pop si
0000011D  0000              add [bx+si],al
0000011F  00894638          add [bx+di+0x3846],cl
00000123  89563C            mov [bp+0x3c],dx
00000126  66C705997D0000    mov dword [di],0x7d99
0000012D  3F                aas
0000012E  000F              add [bx],cl
00000130  0115              add [di],dx
00000132  99                cwd
00000133  7D00              jnl 0x135
00000135  00FF              add bh,bh
00000137  6F                outsw
00000138  105051            adc [bx+si+0x51],dl
0000013B  52                push dx
0000013C  50                push ax
0000013D  66BAF201B001      mov edx,0x1b001f2
00000143  EE                out dx,al
00000144  6642              inc edx
00000146  58                pop ax
00000147  EE                out dx,al
00000148  6642              inc edx
0000014A  B108              mov cl,0x8
0000014C  D3E8              shr ax,cl
0000014E  EE                out dx,al
0000014F  6642              inc edx
00000151  D3E8              shr ax,cl
00000153  EE                out dx,al
00000154  6642              inc edx
00000156  D3E8              shr ax,cl
00000158  0CE0              or al,0xe0
0000015A  EE                out dx,al
0000015B  6642              inc edx
0000015D  B020              mov al,0x20
0000015F  EE                out dx,al
00000160  EC                in al,dx
00000161  2488              and al,0x88
00000163  3C08              cmp al,0x8
00000165  75F9              jnz 0x160
00000167  B90001            mov cx,0x100
0000016A  0000              add [bx+si],al
0000016C  66BAF00166ED      mov edx,0xed6601f0
00000172  668903            mov [bp+di],eax
00000175  83C302            add bx,byte +0x2
00000178  E2F6              loop 0x170
0000017A  5A                pop dx
0000017B  59                pop cx
0000017C  58                pop ax
0000017D  C3                ret
0000017E  89C2              mov dx,ax
00000180  C1E010            shl ax,byte 0x10
00000183  6609D8            or eax,ebx
00000186  81E20000          and dx,0x0
0000018A  FF                db 0xff
0000018B  FFC1              inc cx
0000018D  C2080F            ret 0xf08
00000190  CA6631            retf 0x3166
00000193  DB09              fisttp dword [bx+di]
00000195  DA09              fimul dword [bx+di]
00000197  CAC300            retf 0xc3
0000019A  0000              add [bx+si],al
0000019C  7E00              jng 0x19e
0000019E  0000              add [bx+si],al
000001A0  0000              add [bx+si],al
000001A2  0000              add [bx+si],al
000001A4  0000              add [bx+si],al
000001A6  0000              add [bx+si],al
000001A8  0000              add [bx+si],al
000001AA  0000              add [bx+si],al
000001AC  0000              add [bx+si],al
000001AE  0000              add [bx+si],al
000001B0  0000              add [bx+si],al
000001B2  0000              add [bx+si],al
000001B4  0000              add [bx+si],al
000001B6  0000              add [bx+si],al
000001B8  0000              add [bx+si],al
000001BA  0000              add [bx+si],al
000001BC  0000              add [bx+si],al
000001BE  0000              add [bx+si],al
000001C0  0000              add [bx+si],al
000001C2  0000              add [bx+si],al
000001C4  0000              add [bx+si],al
000001C6  0000              add [bx+si],al
000001C8  0000              add [bx+si],al
000001CA  0000              add [bx+si],al
000001CC  0000              add [bx+si],al
000001CE  0000              add [bx+si],al
000001D0  0000              add [bx+si],al
000001D2  0000              add [bx+si],al
000001D4  0000              add [bx+si],al
000001D6  0000              add [bx+si],al
000001D8  0000              add [bx+si],al
000001DA  0000              add [bx+si],al
000001DC  0000              add [bx+si],al
000001DE  0000              add [bx+si],al
000001E0  0000              add [bx+si],al
000001E2  0000              add [bx+si],al
000001E4  0000              add [bx+si],al
000001E6  0000              add [bx+si],al
000001E8  0000              add [bx+si],al
000001EA  0000              add [bx+si],al
000001EC  0000              add [bx+si],al
000001EE  0000              add [bx+si],al
000001F0  0000              add [bx+si],al
000001F2  0000              add [bx+si],al
000001F4  0000              add [bx+si],al
000001F6  0000              add [bx+si],al
000001F8  0000              add [bx+si],al
000001FA  0000              add [bx+si],al
000001FC  0000              add [bx+si],al
000001FE  55                push bp
000001FF  AA                stosb
