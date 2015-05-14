### Tömbök (Arrays)
Az Array típus arra jó, hogy több dolgot összecsoportosítsük egy szép listába. Ebben a példában az Array három String típusú elemet tartalmaz. 

```java
Array tombom = {"répa","retek","mogyoró"};
```

Amikor megvan a tömb, és az elemeit szeretnénk tudni, akkor szögletes zárójelekbe teszük az elemnek a sorszámát rögtön a tömb neve után. Fontos tudni, hogy az első elem a _nulladik_ sorszám, a második elem az _első_ sorszám, stb.  Tehát,

```java
tombom[0] // "répa"
tombom[1] // "retek"
tombom[2] // "mogyoró"
```

Hogyha a tömbnek az elem számát szeretnénk tudni, akkor a '.length' tulajdonságát használjuk. Ezeket összetéve tudunk egy egyszerű programot írni, ami kiírja a tömb elemeit.

```java
  Array tombom = {"répa","retek","mogyoró"};
  for(int i = 0; i<tombom.length; i++) {
    println(tombom[i]);
  }
```

### Gyakorlat

1. Írj egy programot, ami összeadja egy egészszámokat tartalmazó tömbnek az elemeit és a végén kiírja az összeget.

2. Írj egy programot, ami kiírja egy egészszámokat tartalmazó tömbnek a legnagyobb értékét.

Az útobbi gyakorlat talán egy kicsit nehéz, úgyhogy ha sikerül, akkor legyél büszke!  Ezeknek a megoldását az 'array1\_0.pde' fájlban megtaláljátok.

3. Rajzold meg a koncentrikus köröket úgy, hogy a különböző színeket egy tömbben tároljuk. Ennek a megoldását az 'array\_korSzinek.pde' fájlban megtaláljátok. 

### Házifeladat
1. Keresd meg egy egész típusú értékekbõl álló tömbben egy értéket (pl.: 42)! Ha benne van, írd ki a sorszámát!

2. Írd ki egy egész típusú értékekbõl álló tömb elemeinek átlagát! Vigyázz! Nem biztos hogy egész a végeredmény! :)

3. Írd ki fordítva egy tömb elemeit!
	- pl.: Array tombom = {"répa","retek","mogyoró"}; akkor azt írja ki, hogy : mogyoró retek répa


### Szorgalmi:
1. Határozd meg egy egész típusú értékekbõl álló tömbben lévõ pozitív, negatív és nulla elemek darabszámát!

2. Legyen két egész típusú értékekbõl álló tömböd, amelyeknek ugyanannyi eleme van. Rajzolj ki köröket, melyek középpontjának elsõ koordinátáját az elsõ, a másodikat a második tömbbõl vesszük!
	- pl.: Array xKoord = {100,10,200}; Array yKoord = {10,100,250}; => kirajzolsz a (100,10), (10,100), (200,250) pontok köré köröket
	- ha ez megy, tömbbõl vedd a körök színeit
	- ha ez is, akkor az átmérõjüket is
