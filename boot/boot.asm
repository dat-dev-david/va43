bits 16
default abs
org 0x7c00

hello_system: db "starting seq.1 [boot]", 0xd, 0xa, 0x0
second_stage: db "jumping to seq.2 [boot]", 0xd, 0xa, 0x0
jump: dw 0x00007e00

init:
    cli 

    ;clear segment reg
    xor ax,ax
    mov ds, ax
    mov cs, ax
    mov ss, ax
    mov es, ax

    ;move sp to 0000:7c00 %ss:[sp]%
    mov sp, 0x7c00
    sti

    ;print msg's
    mov si, hello_system
    call print

    mov si, second_stage
    call print
    
    ;far jmp to 0x7e00(second stage)
    jmp far [jump]

    ;prevent further exec
    .halt:
        jmp .halt


;uses bios func 0x10
print:
    ;ah:0x0e -> TTY 
    ;bh:0x0 -> page:0
    ;bl:0xf -> colour:White
    mov ah, 0x0e
    mov bh, 0x0
    mov bl, 0xf

    ;load byte ds:[si] -> al 
    ;then if al==0
    ;calls int 0x10
    lodsb
    test al, al
    je .return
    int 0x10
    jmp $
    .return:
        ret

times 510 - ($ - $$) db 0
dw 0xaa55