; This is a 64-bit x86 assembly program in NASM syntax for Linux.
; It prints "Hello, World!" to the console, converted from a 32-bit version.
; We're using 64-bit system calls and registers, with verbose comments for beginners.

; .text section is readable and executable but not writable
; .data section is readable and writable but not executable

;___________________________________________________________________
; ________________________ SECTION: TEXT ___________________________

; Section declaration: '.text' is where our executable code lives.
; This contains the instructions the CPU will execute.
section .text

; Define any global variables (global section is commonly placed in .text section but can go anywhere)
; Declare '_start' as the entry point of our program.
; This is like the "main" function in C or Python, where execution begins.
global _start


; Although it's not necessary to specify the syntax, it's good practive as the GNU Assembler (GAS) assumes AT&T unless otherwise stated
; intel_syntax

; The '_start' label marks the start of our program.
_start:

; In 64-bit Linux, we use the 'syscall' instruction for system calls.
; The system call for writing to a file descriptor (like the console) is SYS_WRITE, number 1.
; We set up registers with specific values to tell the kernel what to do.

; ===== PRINTING A STRING =====
mov rax, 1          ; A: [Prepare write]
; Move the number 1 into RAX (SYS_WRITE system call number).
; 'mov' copies a value into a register.
; RAX is the 64-bit version of EAX, used for system call numbers.
; In 32-bit, this was 'mov eax, 4' because SYS_WRITE was 4.

mov rdi, 1          ; B: [Define where to write]
; Register RDI specifies where to write the data (first argument).
; File descriptor 1 is stdout (the console), same as in 32-bit.
; Move 1 into RDI (replaces EBX from 32-bit).

mov rsi, message    ; C: [Define where to find our message]
; Register RSI holds the address of the string to print (second argument).
; The string "Hello, World!" is in the .data section (defined below).
; Move the address of 'message' into RSI (replaces ECX from 32-bit).
; RSI points to the start of the string in memory.

mov rdx, message_len ; D: [Define msg length]
; Register RDX holds the length of the string (third argument).
; The string "Hello, World!\n" is 14 characters (13 + newline).
; Move 14 into RDX (same as EDX in 32-bit, but 64-bit register).
;mov rdx, 14         ;  Alternative - hard-code length (14)


syscall             ; E: [Trigger system call to print]
; Execute the SYS_WRITE system call using 'syscall'.
; This replaces 'int 0x80' from 32-bit, as 64-bit Linux uses 'syscall'.
; The kernel prints "Hello, World!" followed by a newline to the console.


; ===== EXITING A PROGRAM =====
; We use the SYS_EXIT system call to end the program, number 60 in 64-bit Linux.

mov rax, 60         ; Prepare system for exit
; Move 60 into RAX for SYS_EXIT (was 1 in 32-bit).
; This tells the kernel we want to exit.

mov rdi, 0          ; Move 0 into RDI to set the exit status (replaces EBX).
; An exit status of 0 means the program ended successfully.

syscall             ; Call the kernel to execute SYS_EXIT.
; This terminates the program (replaces 'int 0x80').

;___________________________________________________________________
; ________________________ SECTION: DATA ___________________________

; Section for initialized data, like our string.
section .data

; Define the string "Hello, World!" followed by a newline character (\n).
; 'message' is the label we use to refer to this string in our code.
; 'db' stands for "define bytes," storing raw bytes in memory.
message db 'Hello, World!', 0xA
; This is unchanged from 32-bit, as the string is the same.

; There are 3 ways to define a string with nasm
;db 'Hello world', 10 ; with single quotes
;db "Hello world", 10 ; with double quotes
;db `Hello world\n`   ; with backticks, \n, \r, \t, etc are available



; The length of the string (13 for "Hello, World!" + 1 for newline = 14).
; Defined for clarity, though not used directly here.
message_length equ 14


; Get string length : a trick to get the length of a string. It looks like a pointer subtraction, $ being the pointer to the current instruction, ie the end of the string, and message being the pointer to the beginning of the string
message_len equ $-message







