CCPREFIX := 
 
CC := $(CCPREFIX)gcc 
AR := $(CCPREFIX)ar  
LD := $(CCPREFIX)ld  
OBJCOPY := $(CCPREFIX)objcopy  
OBJDUMP := $(CCPREFIX)objdump 
OBJNM := $(CCPREFIX)nm 

include build.mk

LIBS := $(patsubst %.c, %.o, $(SRC))
PRE_PILE := $(patsubst %.c, %.i, $(SRC))
COMPILE := $(patsubst %.c, %.S, $(SRC))
#$(warning $(LIBS))

CFLAGS := -g

.PHONY: all

target := map

all:$(target)

$(target): $(LIBS) $(PRE_PILE) $(COMPILE)
	$(CC) -o $@ $(CFLAGS) $(LIBS) 

$(PRE_PILE):$(SRC)
	$(CC) -o $@ -E $<

$(COMPILE):$(SRC)
	$(CC) -o $@ -c $<

.c.o:
	$(CC) -o $@ -c $<

clean:
	$(RM) *.o $(target) *.i *.S
