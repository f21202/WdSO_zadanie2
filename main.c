#include <stdio.h>
#include "volume.h"
#include "area.h"

int main()
{
    int len;
    printf("Podaj wartość długości boku: ");
    scanf("%d", &len);
    
    int ar=area(len);
    int vol=volume(len);

    printf("Pole kwadratu o podanej krawędzi wynosi: %d\n", ar);
    printf("Objętość sześcianu o podanej długości boku wynosi: %d\n", vol);

    return 0;
}