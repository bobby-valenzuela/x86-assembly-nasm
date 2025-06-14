; This is a 64-bit x86 assembly program in NASM syntax for Linux.

; Using 'main' since we are going to compile with gcc: 
        ; nasm hello.s -f elf64 -o hello.o && gcc -Wall -Wextra -Werror -o hello hello.o

section .rodata
    format: db 'Hello %s', 10, 0
    name:   db 'Conrad', 0

section .text
        global main
        extern printf
    main:
        ; printf(format, name)
        MOV rdi, format
        MOV rsi, name
        ; no XMM registers
        MOV rax, 0
        call printf
        ; return 0
        MOV rax, 0
        ret


