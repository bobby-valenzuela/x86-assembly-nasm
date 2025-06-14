Compile object file(s) x86-32 (32-bit)  
`nasm -f elf32 app.asm` (_creates app.o_)  

Link object files and create executable  
`ld -m elf_i386 app.o -o app`  

<br />

Compile object file(s) x86-64 (64-bit)  
`nasm -f elf64 app.asm` (_creates app.o_)`  

Link object files and create executable  
`ld app.o -o app`  







