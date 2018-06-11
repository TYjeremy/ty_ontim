00007C00  B800B8            mov ax,0xb800
00007C03  8EC0              mov es,ax
00007C05  26C60600004C      mov byte [es:0x0],0x4c
00007C0B  26C606010007      mov byte [es:0x1],0x7
00007C11  26C606020061      mov byte [es:0x2],0x61
00007C17  26C606030007      mov byte [es:0x3],0x7
00007C1D  26C606040062      mov byte [es:0x4],0x62
00007C23  26C606050007      mov byte [es:0x5],0x7
00007C29  26C606060065      mov byte [es:0x6],0x65
00007C2F  26C606070007      mov byte [es:0x7],0x7
00007C35  26C60608006C      mov byte [es:0x8],0x6c
00007C3B  26C606090007      mov byte [es:0x9],0x7
00007C41  26C6060A0020      mov byte [es:0xa],0x20
00007C47  26C6060B0007      mov byte [es:0xb],0x7
00007C4D  26C6060C006F      mov byte [es:0xc],0x6f
00007C53  26C6060D0007      mov byte [es:0xd],0x7
00007C59  26C6060E0066      mov byte [es:0xe],0x66
00007C5F  26C6060F0007      mov byte [es:0xf],0x7
00007C65  26C606100066      mov byte [es:0x10],0x66
00007C6B  26C606110007      mov byte [es:0x11],0x7
00007C71  26C606120073      mov byte [es:0x12],0x73
00007C77  26C606130007      mov byte [es:0x13],0x7
00007C7D  26C606140065      mov byte [es:0x14],0x65
00007C83  26C606150007      mov byte [es:0x15],0x7
00007C89  26C606160074      mov byte [es:0x16],0x74
00007C8F  26C606170007      mov byte [es:0x17],0x7
00007C95  26C60618003A      mov byte [es:0x18],0x3a
00007C9B  26C606190007      mov byte [es:0x19],0x7
00007CA1  B82E01            mov ax,0x12e
00007CA4  BB0A00            mov bx,0xa
00007CA7  8CC9              mov cx,cs
00007CA9  8ED9              mov ds,cx
00007CAB  BA0000            mov dx,0x0
00007CAE  F7F3              div bx
00007CB0  88162E7D          mov [0x7d2e],dl
00007CB4  31D2              xor dx,dx
00007CB6  F7F3              div bx
00007CB8  88162F7D          mov [0x7d2f],dl
00007CBC  31D2              xor dx,dx
00007CBE  F7F3              div bx
00007CC0  8816307D          mov [0x7d30],dl
00007CC4  31D2              xor dx,dx
00007CC6  F7F3              div bx
00007CC8  8816317D          mov [0x7d31],dl
00007CCC  31D2              xor dx,dx
00007CCE  F7F3              div bx
00007CD0  8816327D          mov [0x7d32],dl
00007CD4  A0327D            mov al,[0x7d32]
00007CD7  0430              add al,0x30
00007CD9  26A21A00          mov [es:0x1a],al
00007CDD  26C6061B0004      mov byte [es:0x1b],0x4
00007CE3  A0317D            mov al,[0x7d31]
00007CE6  0430              add al,0x30
00007CE8  26A21C00          mov [es:0x1c],al
00007CEC  26C6061D0004      mov byte [es:0x1d],0x4
00007CF2  A0307D            mov al,[0x7d30]
00007CF5  0430              add al,0x30
00007CF7  26A21E00          mov [es:0x1e],al
00007CFB  26C6061F0004      mov byte [es:0x1f],0x4
00007D01  A02F7D            mov al,[0x7d2f]
00007D04  0430              add al,0x30
00007D06  26A22000          mov [es:0x20],al
00007D0A  26C606210004      mov byte [es:0x21],0x4
00007D10  A02E7D            mov al,[0x7d2e]
00007D13  0430              add al,0x30
00007D15  26A22200          mov [es:0x22],al
00007D19  26C606230004      mov byte [es:0x23],0x4
00007D1F  26C606240044      mov byte [es:0x24],0x44
00007D25  26C606250007      mov byte [es:0x25],0x7
00007D2B  E9FDFF            jmp word 0x7d2b
00007D2E  0000              add [bx+si],al
00007D30  0000              add [bx+si],al
00007D32  0000              add [bx+si],al
00007D34  0000              add [bx+si],al
00007D36  0000              add [bx+si],al
00007D38  0000              add [bx+si],al
00007D3A  0000              add [bx+si],al
00007D3C  0000              add [bx+si],al
00007D3E  0000              add [bx+si],al
00007D40  0000              add [bx+si],al
00007D42  0000              add [bx+si],al
00007D44  0000              add [bx+si],al
00007D46  0000              add [bx+si],al
00007D48  0000              add [bx+si],al
00007D4A  0000              add [bx+si],al
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
