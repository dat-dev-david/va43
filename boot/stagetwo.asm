bits 16
default abs
org 0x7e10 ;7e10+01be=7fce

align 4
DAP:
    db 0x10
    db 0x0
    dw 0x1
    dd 0x0
    dd 0x7c00
    .hi_lba_a:
        resb 2
    .hi_lba_b:
        resb 2
    .lo_lba:
        dd 0x0

;org directive stuff
xor ax,ax
mov ds, ax
mov es, ax

;move dap's to stack
push bp
mov sp, bp
mov si, 0x7fce
mov cx, 28
push_dap:
    lodsw
    push ax
    loop push_dap


dap_boot_check:
    .dap1:
        cmp byte [bp+64], 0
        je .dap1fail
    .dap2:
        cmp byte [bp+48], 0
        je .dap2fail
    .dap3:
        cmp byte [bp+32], 0
        je .dap3fail
    .dap4:
        cmp byte [bp+16], 0
        je .dap4fail
    mov dx, 0x
    .dap1fail:
        shr dx
    ret


pop bp
kill:
    jmp $
