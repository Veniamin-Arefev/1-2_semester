all: prog cleanup

prog: main.o func.o
	gcc -o prog main.o func.o -m32 -lm
main.o: main.c
	gcc -c -o main.o main.c -m32
func.o: func.asm
	nasm -f ELF32 -o func.o func.asm
cleanup:
	rm main.o func.o
