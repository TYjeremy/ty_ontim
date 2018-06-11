CCPREFIX := 
 
CC := $(CCPREFIX)gcc 
AR := $(CCPREFIX)ar  
LD := $(CCPREFIX)ld  
OBJCOPY := $(CCPREFIX)objcopy  
OBJDUMP := $(CCPREFIX)objdump 
OBJNM := $(CCPREFIX)nm 
NASM := $(CCPREFIX)nasm

include build.mk

#LIBS := $(patsubst %.c, %.o, $(SRC))
#PRE_PILE := $(patsubst %.c, %.i, $(SRC))
#COMPILE := $(patsubst %.c, %.S, $(SRC))
#$(warning $(LIBS))

CFLAGS := -g

.PHONY: all

target := a.img
all := $(target)
tmp := boot.bin

all:$(target)
	ndisasm -o 0x7c00 boot.bin >> disboot.asm

$(target):$(tmp)
	$(shell dd if=$< of=$@ bs=512 count=1 conv=notrunc)

$(tmp): $(SRC)
	$(NASM) $(SRC) -o $@

$(PRE_PILE):$(SRC)
	$(CC) -o $@ -E $<

clean:
	$(RM) *.bin disboot.asm
