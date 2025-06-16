Learning Basics of x86 65-bit assembly using Intel syntax and Nasm compiler

Compile object file(s) x86-32 (32-bit)  
`nasm -f elf32 app.asm` (_creates app.o_)  

Link object files and create executable  
`ld -m elf_i386 app.o -o app`  

<br />

Compile object file(s) x86-64 (64-bit)  
`nasm -f elf64 app.asm` (_creates app.o_)`  

Link object files and create executable  
`ld app.o -o app`  


Sources:  
[YouTube Playlist: x86_64 Linux Assembly](https://www.youtube.com/playlist?list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn)  
[Article: Assembly from scratch](https://www.conradk.com/x86-64-assembly-from-scratch/)  
[Article: Assembly Tutorial](https://gpfault.net/posts/asm-tut-0.txt.html)  
[Various Github Notes](https://github.com/0xAX/asm)



