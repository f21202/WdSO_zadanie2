.PHONY: all
.SUFFIXES: .c .o .h .a

all:
	Code2
	remove

.o:
	gcc -o $@ $^

.c.o:
	gcc -c $<


Code2: main.o libarea.a libvolume.so
	gcc -o $@ $^

main.o: main.c area.h volume.h

area.o: area.c

libarea.a: area.o
	ar rs $@ $^

volume.o: volume.c
	gcc -fPIC -c $^
	
libvolume.so: volume.o
	gcc -shared -o $@ $^

remove: main.o area.o volume.o 
	rm $^
