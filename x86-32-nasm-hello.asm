; This is an x86 assembly program that prints "Hello, World!" to the console.
; We're using NASM syntax for a 32-bit Linux system.
; Every line will have detailed comments to explain what's happening.

; Section declaration: '.text' is where our executable code lives.
; Think of it as the main area where the computer's instructions are stored.
section .text
; Nasm also accepts ".section .text" but the dot before 'section' can be omitted as a common shorthand

; This line tells the assembler that '_start' is the entry point of our program.
; It's like the "main" function in languages like C or Python.
global _start

; This is the label for the start of our program. The computer begins executing here.
_start:

    ; --- Step 1: Preparing to print "Hello, World!" ---
    ; We will use a Linux system call to write text to the console (stdout).
    ; System calls are like asking the operating system to do something for us,
    ; such as printing text, reading input, or exiting the program.

    ; In Linux, the system call for writing is number 4 (SYS_WRITE).
    ; We need to set up registers with specific values to tell the system what to do.
    ; Registers are like small, super-fast variables inside the CPU.

    ; Register EAX will hold the system call number (4 for SYS_WRITE).
    mov eax, 4          ; Move the number 4 into the EAX register.
                        ; 'mov' means "move" or copy a value into a register.
                        ; EAX is a general-purpose register used for system call numbers.

    ; Register EBX specifies where to write the data.
    ; For printing to the console, we use file descriptor 1 (stdout).
    ; A file descriptor is like a handle to an output destination (console, file, etc.).
    mov ebx, 1          ; Move the number 1 into EBX to indicate stdout.

    ; Register ECX holds the address of the string we want to print.
    ; Our string "Hello, World!" is stored in the .data section (defined below).
    ; We use the label 'message' to point to it.
    mov ecx, message    ; Move the address of 'message' into ECX.
                        ; ECX now points to the start of our string in memory.

    ; Register EDX holds the length of the string to print.
    ; Our string "Hello, World!\n" is 14 characters long (including the newline).
    mov edx, 14         ; Move the number 14 into EDX to specify the string length.

    ; --- Step 2: Making the system call to print the string ---
    ; Now that the registers are set up, we trigger the system call.
    ; In x86 Linux, system calls are invoked using the 'int 0x80' instruction.
    ; 'int' stands for interrupt, and 0x80 is the specific interrupt for Linux system calls.
    int 0x80            ; Call the Linux kernel to execute the SYS_WRITE system call.
                        ; This will print "Hello, World!" followed by a newline to the console.

    ; --- Step 3: Exiting the program ---
    ; After printing, we need to tell the operating system that our program is done.
    ; We use the SYS_EXIT system call, which is number 1 in Linux.

    mov eax, 1          ; Move the number 1 into EAX to indicate SYS_EXIT.
                        ; This tells the kernel we want to exit the program.

    mov ebx, 0          ; Move 0 into EBX to set the exit status.
                        ; An exit status of 0 means the program ended successfully.
                        ; Non-zero values usually indicate errors.

    int 0x80            ; Call the Linux kernel to execute the SYS_EXIT system call.
                        ; This terminates the program.

; --- Section for data (our string) ---
; The '.data' section is where we store initialized data, like our string.
section .data

    ; Define the string "Hello, World!" followed by a newline character (\n).
    ; 'message' is the label we use to refer to this string in our code.
    ; 'db' stands for "define bytes," meaning we're storing raw bytes in memory.
    message db 'Hello, World!', 0xA
                        ; The string isწ

    ; The length of the string (13 for "Hello, World!" + 1 for the newline = 14).
    ; We define this explicitly for clarity, though NASM can calculate it.
    message_length equ 14
