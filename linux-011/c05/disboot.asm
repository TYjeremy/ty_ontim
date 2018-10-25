00007C00  B8C007            mov ax,0x7c0
00007C03  8ED8              mov ds,ax
00007C05  B80090            mov ax,0x9000
00007C08  8EC0              mov es,ax
00007C0A  B90001            mov cx,0x100
00007C0D  29F6              sub si,si
00007C0F  29FF              sub di,di
00007C11  F3A5              rep movsw
00007C13  EA18000090        jmp word 0x9000:0x18
00007C18  8CC8              mov ax,cs
00007C1A  8ED8              mov ds,ax
00007C1C  8EC0              mov es,ax
00007C1E  8ED0              mov ss,ax
00007C20  BC00FF            mov sp,0xff00
00007C23  B406              mov ah,0x6
00007C25  B000              mov al,0x0
00007C27  B500              mov ch,0x0
00007C29  B100              mov cl,0x0
00007C2B  B650              mov dh,0x50
00007C2D  B250              mov dl,0x50
00007C2F  CD10              int 0x10
00007C31  BA0000            mov dx,0x0
00007C34  B90200            mov cx,0x2
00007C37  BB0002            mov bx,0x200
00007C3A  B80402            mov ax,0x204
00007C3D  CD13              int 0x13
00007C3F  722B              jc 0x7c6c
00007C41  7300              jnc 0x7c43
00007C43  B91A00            mov cx,0x1a
00007C46  BB0700            mov bx,0x7
00007C49  BD6D00            mov bp,0x6d
00007C4C  B80113            mov ax,0x1301
00007C4F  CD10              int 0x10
00007C51  B200              mov dl,0x0
00007C53  B80008            mov ax,0x800
00007C56  CD13              int 0x13
00007C58  B500              mov ch,0x0
00007C5A  B80090            mov ax,0x9000
00007C5D  8EC0              mov es,ax
00007C5F  B80802            mov ax,0x208
00007C62  83FB0F            cmp bx,byte +0xf
00007C65  7400              jz 0x7c67
00007C67  EA00002090        jmp word 0x9020:0x0
00007C6C  F4                hlt
00007C6D  4C                dec sp
00007C6E  6F                outsw
00007C6F  61                popaw
00007C70  64696E67206D      imul bp,[fs:bp+0x67],word 0x6d20
00007C76  7920              jns 0x7c98
00007C78  7379              jnc 0x7cf3
00007C7A  7374              jnc 0x7cf0
00007C7C  656D              gs insw
00007C7E  202E2E2E          and [0x2e2e],ch
00007C82  68656C            push word 0x6c65
00007C85  6C                insb
00007C86  6F                outsw
00007C87  0000              add [bx+si],al
00007C89  0103              add [bp+di],ax
00007C00  B8C007            mov ax,0x7c0
00007C03  8ED8              mov ds,ax
00007C05  B80090            mov ax,0x9000
00007C08  8EC0              mov es,ax
00007C0A  B90001            mov cx,0x100
00007C0D  29F6              sub si,si
00007C0F  29FF              sub di,di
00007C11  F3A5              rep movsw
00007C13  EA18000090        jmp word 0x9000:0x18
00007C18  8CC8              mov ax,cs
00007C1A  8ED8              mov ds,ax
00007C1C  8EC0              mov es,ax
00007C1E  8ED0              mov ss,ax
00007C20  BC00FF            mov sp,0xff00
00007C23  B406              mov ah,0x6
00007C25  B000              mov al,0x0
00007C27  B500              mov ch,0x0
00007C29  B100              mov cl,0x0
00007C2B  B650              mov dh,0x50
00007C2D  B250              mov dl,0x50
00007C2F  CD10              int 0x10
00007C31  BA0000            mov dx,0x0
00007C34  B90200            mov cx,0x2
00007C37  BB0002            mov bx,0x200
00007C3A  B80402            mov ax,0x204
00007C3D  CD13              int 0x13
00007C3F  7234              jc 0x7c75
00007C41  7300              jnc 0x7c43
00007C43  B91A00            mov cx,0x1a
00007C46  BB0700            mov bx,0x7
00007C49  BD7600            mov bp,0x76
00007C4C  B80113            mov ax,0x1301
00007C4F  CD10              int 0x10
00007C51  B200              mov dl,0x0
00007C53  B80008            mov ax,0x800
00007C56  CD13              int 0x13
00007C58  B500              mov ch,0x0
00007C5A  2E890E9000        mov [cs:0x90],cx
00007C5F  B80090            mov ax,0x9000
00007C62  8EC0              mov es,ax
00007C64  B80802            mov ax,0x208
00007C67  83FB0F            cmp bx,byte +0xf
00007C6A  7400              jz 0x7c6c
00007C6C  2EA39200          mov [cs:0x92],ax
00007C70  EA00002090        jmp word 0x9020:0x0
00007C75  F4                hlt
00007C76  4C                dec sp
00007C77  6F                outsw
00007C78  61                popaw
00007C79  64696E67206D      imul bp,[fs:bp+0x67],word 0x6d20
00007C7F  7920              jns 0x7ca1
00007C81  7379              jnc 0x7cfc
00007C83  7374              jnc 0x7cf9
00007C85  656D              gs insw
00007C87  202E2E2E          and [0x2e2e],ch
00007C8B  68656C            push word 0x6c65
00007C8E  6C                insb
00007C8F  6F                outsw
00007C90  0000              add [bx+si],al
00007C92  0103              add [bp+di],ax
