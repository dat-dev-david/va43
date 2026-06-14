[bits 64]
[org 0x7c00]

init:
    cli ;stop interr for MBR pocessing?
    mov sp, 0x7c00
    xor ax,ax
    xor ds,ds
    xor ss,ss
    xor es,es
    xor fs,fs
    xor gs,gs
    sti

    mov rax, 60
    mov rdi, 0
    syscall
