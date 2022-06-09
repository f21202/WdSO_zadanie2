Autor: Filip Mikołaj Uliasz, nr albumu 97758

UWAGA: Po skompilowaniu programu według stanu ze wszystkich commitów, z uwagi na wykorzystanie biblioteki współdzielonej, należy wydać w terminalu polecenie:
	export LD_LIBRARY_PATH=$(pwd)
	którego zadaniem jest wskazanie linkerowi, gdzie powinien szukać biblioteki niezbędnej do prawidłowego działania programu. Polecenie to wystarczy wydać tylko raz, przed pierwszym uruchomieniem programu. Ścieżka zostanie zapisana w tej zmiennej systemowej aż do momentu ponownego uruchomienia maszyny.

UWAGA2: Z zupełnie nieznanego mi powodu (ze 100% pewnością twierdzę, że to błąd systemu, a nie moja wina), coś dziwnego stało się z plikami nagłówkowymi, które w poprzednich commitach wyglądały "Jak Bóg przykazał", a przy ostatnim (5 commicie) zaszyfrowały się do postaci binarnej. Nie mam pojęcia dlaczego, bo nic przy nich nie ruszałem. Proszę o sprawdzenie tych plików w takim kształcie, jaki miały na początku. 

	Commit 1: Inicjalizacja repo
		Do nowopowstałego repo dodano wszystkie pliki źródłowe i nagłówkowe, a więc: main.c, area.c, volume.c, area.h, volume.h. Ponadto utworzono i dodano do repo niniejszy plik README.md.
	
	Commit 2: Prosty makefile
	Utworzono następujące cele (wymienione w kolejności wykonywania, od najbardziej podstawowego do najbardziej złożonego):
		main.o i area.o - cele, dzięki którym z plików, odpowiednio: main.c i area.c, utworzono pliki obiektowe. W tym celu posłużono się podstawowym poleceniem kompilatora gcc -c <nazwa pliku .c>
		volume.o - cel, który tworzy plik obiektowy z kodu źródłowego. Jako, że funkcja volume zostanie zapisana w bibliotece wspóldzielonej, posłużono się poleceniem gcc -fPIC -o
		libarea.a - cel, który stworzy bibliotekę statyczną libarea.a. Wymaga pliku area.a, do utworzenia biblioteki jest wykorzystywane polecenie ar rs.
		libvolume.so: cel tworzący bibliotekę współdzieloną libvolume.so z pliku obiektowego volume.o. Posłużono się poleceniem gcc -shared -o
		Code2: główny cel makefile'a. Kompiluje cały program, tworząc z niego plik wykonywalny. Wymaga pliku obiektowego main.o oraz obu bibliotek: libarea.a oraz libvolume.so
		remove: sztuczny cel, którego zadaniem jest usunięcie plików - śmieci, które powstały podczas instalacji programu. Są to: main.o, area.o oraz volume.o. W celu usunięcia plików posłużono się poleceniem rm.
		
	Commit 3: Zmienne automatyczne
		Istniejący już plik makefile zmodyfikowano tak, by realizował powierzone mu działanie za pomocą zmiennych automatycznych, takich jak:
			$@ - odwołuje się do pliku - celu
			$^ - zwraca listę zależności. Zależności są pooddzielane spacjami, nie zawierają powtórzeń tego samego pliku
			$* - zwraca nazwę pliku - celu, jednak pozbawioną rozszerzenia (tzn. jeżeli cel nazywa się main.o, to $* zwróci "main")
			
	Commit 4: Reguły przyrostków
		Istniejący makefile rozbudowano o dwie reguły przyrostków: pierwsza, .o, ma za zadanie kompilowanie programu z plików obiektowych. Druga, .c.o tworzy pliki obiektowe wprost z kodu źródłowego. Regłu przyrostków mają swoje wady. W związku z tym w piątym commicie uzupełniono plik makefile o reguły wzorców.
		
	Commit 5: Reguły wzorca
		Makefile z poprzedniego zadania przepisano tak, by w całości opierał się na regułach wzorca. Zdefiniowano cele PHONY: all i remove. all w założeniu kompiluje program i usuwa zbędne pliki .o za pomocą celu remove. Ponadto napisano dwa cele, które tworzą z plików kodu źródłowego pliki obiektowe - %.o: %.c, przy czym jeden z nich wymaga obu plików nagłówkowych (volume.h oraz area.h). Następnie napisano regułę, która z pliku obiektowego tworzy bibliotekę statyczną (ar -rs). Kolejna reguła tworzy z pliku obiektowego bibliotekę dynamiczną (gcc -shared -o). Następna kompiluje cały program, a więc wymaga pliku main.o i obu bibliotek. Poniżej wywoływano poszczególne reguły. Warto jeszcze zwrócić uwagę na fałszywy cel remove u dołu pliku makefile, którego zadaniem jest usunięcie plików obiektowych, które po kompilacji nie są już do niczego potrzebne.
