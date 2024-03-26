all:
	nasm -f elf32 -g -o kalkulator.o kalkulator.asm
	ld -m elf_i386 -g -o kalkulator kalkulator.o
	gdb -x ttt ./kalkulator