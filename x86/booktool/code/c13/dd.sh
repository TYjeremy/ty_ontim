dd if=c13_mbr.bin of=c.img bs=512 count=1 conv=notrunc
dd if=c13_core.bin of=c.img bs=512 seek=1 conv=notrunc
dd if=c13.bin of=c.img bs=512 seek=50 conv=notrunc
dd if=diskdata.txt of=c.img bs=512 seek=100 conv=notrunc
