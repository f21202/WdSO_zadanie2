.PHONY: all remove
.SUFFIXES:

%.o: %.c *.h *.h
	gcc -c $<

%.o: %.c
	gcc -c -fPIC $<

lib%.a: %.o
	ar -rs $@ $<

lib%.so: %.o
	gcc -shared -o $@ $<

%: *.o *.a *.so
	gcc -o $@ $^

all: Code2 remove
Code2: main.o libarea.a libvolume.so
main.o: main.c area.h volume.h
area.o: area.c
volume.o: volume.c
libarea.a: area.o
libvolume.so: volume.o

remove: 
	rm *.o
