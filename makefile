Code2: main.o libarea.a libvolume.so
	gcc -o Code2 main.o libarea.a libvolume.so

main.o: main.c area.h volume.h
	gcc -c main.c

area.o: area.c
	gcc -c area.c

libarea.a: area.o
	ar rs libarea.a area.o

volume.o: volume.c
	gcc -fPIC -c volume.c
	
libvolume.so: volume.o
	gcc -shared -o libvolume.so volume.o

remove: main.o area.o volume.o 
	rm main.o area.o volume.o 
