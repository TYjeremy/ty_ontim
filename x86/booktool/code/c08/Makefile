CCPREFIX := 
 
CC := $(CCPREFIX)gcc 
AR := $(CCPREFIX)ar  
LD := $(CCPREFIX)ld  
OBJCOPY := $(CCPREFIX)objcopy  
OBJDUMP := $(CCPREFIX)objdump 
OBJNM := $(CCPREFIX)nm 
NASM := $(CCPREFIX)nasm
NDISASM := $(CCPREFIX)ndisasm

include build.mk

#BIN := $(patsubst %.c, %, $(SRC))
#PRE_PILE := $(patsubst %.c, %.i, $(SRC))
#COMPILE := $(patsubst %.asm, %.bin, $(SRC))

tmp := $(SRC:%.asm=%)

.PHONY: all


target := c.img

all: $(target)
	$(foreach n, $(tmp), $(NDISASM) $(n).bin > $(n)_dis.asm;)
#	ndisasm -o 0x7c00 boot.bin > disboot.asm

$(target):$(tmp)
	$(shell ./dd.sh)

# %.bin : %.asm
#	$(warning fanxzh)

$(tmp):
	$(foreach n, $(@), $(NASM) $(n).asm -o ${n}.bin;)


$(PRE_PILE):$(SRC)
	$(CC) -o $@ -E $<

clean:
	$(RM) *.bin *_dis.asm
