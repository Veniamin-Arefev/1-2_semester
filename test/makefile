all: myprint
myprint: main.o myprint.o
	gcc main.o myprint.o -o myprint
main.o: main.c myprint.h
	gcc main.c -c
myprintf.o: myprint.c myprint.h
	gcc myprint.c -c
clean:
	rm -f myprint *.o
