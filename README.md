Autor: Filip Mikołaj Uliasz, nr albumu 97758

	Commit 2: Utworzony prosty plik makefile
	
	Utworzono następujące cele (wymienione w kolejności wykonywania, od najbardziej podstawowego do najbardziej złożonego):
		main.o i area.o - cele, dzięki którym z plików, odpowiednio: main.c i area.c, utworzono pliki obiektowe. W tym celu posłużono się podstawowym poleceniem kompilatora gcc -c <nazwa pliku .c>
		volume.o - cel, który tworzy plik obiektowy z kodu źródłowego. Jako, że funkcja volume zostanie zapisana w bibliotece wspóldzielonej, posłużono się poleceniem gcc -fPIC -o
		libarea.a - cel, który stworzy bibliotekę statyczną libarea.a. Wymaga pliku area.a, do utworzenia biblioteki jest wykorzystywane polecenie ar rs.
		libvolume.so: cel tworzący bibliotekę współdzieloną libvolume.so z pliku obiektowego volume.o. Posłużono się poleceniem gcc -shared -o
		Code2: główny cel makefile'a. Kompiluje cały program, tworząc z niego plik wykonywalny. Wymaga pliku obiektowego main.o oraz obu bibliotek: libarea.a oraz libvolume.so
		remove: sztuczny cel, którego zadaniem jest usunięcie plików - śmieci, które powstały podczas instalacji programu. Są to: main.o, area.o oraz volume.o. W celu usunięcia plików posłużono się poleceniem rm.
