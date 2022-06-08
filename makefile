Code2: main.o libarea.a libvolume.so
	gcc -o Code2 $^

main.o: main.c area.h volume.h
	gcc -c $*.c

area.o: area.c
	gcc -c $^

libarea.a: area.o
	ar rs $@ $^

volume.o: volume.c
	gcc -fPIC -c $^
	
libvolume.so: volume.o
	gcc -shared -o $@ $^

remove: main.o area.o volume.o 
	rm $^
