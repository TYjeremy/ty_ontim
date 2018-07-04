dd if=test_mbr.bin of=c.img bs=512 count=1 conv=notrunc
dd if=c08.bin of=c.img seek=100 conv=notrunc
