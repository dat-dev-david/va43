bits 16
default abs
org 0x7e00

xor ax,ax
mov ds, ax
mov es, ax



kill:
    jmp $
