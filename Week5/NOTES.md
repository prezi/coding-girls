# Week 5

## Tömbök

Képzeljük el az alábbi problémát: 

> Rajzoljunk a vászonra 15 darab kört véletlen helyekre. Ezek után a köröket mozgassuk véletlen irányba.

A körök mozgatásához tárolnunk kell a pozíciójukat. Ehhez körönként 2 adat kell: egy x és egy y koordináta. Ez 30 adat amit változóként rögzítenünk kell a kódban.

```Java
void setup() {
    size(800, 600);

    float korX0 = random(width);
    float korX1 = random(width);
    ...
    float korX29 = random(width);

    float korY0 = random(width);
    float korY1 = random(width);
    ...
    float korY29 = random(width);
}
```

Ha ez megvolt, akkor tárolnunk kell a sebességeket. Ez minden körnek véletlenszerű és egyedi. Kell még egy vízszintes és egy függőleges irányú sebesség minden körnek, ez még 30 változó. 

```Java
void setup() {
    size(800, 600);

    float korX0 = random(width);
    ...
    float korY0 = random(width);
    ...

    float sebX0 = random(-10, 10);
    float sebX1 = random(-10, 10);
    ...
    float sebX29 = random(-10, 10);

    float sebY0 = random(-10, 10);
    float sebY1 = random(-10, 10);
    ...
    float sebY29 = random(-10, 10);
}
```

Mielőtt kitalálnám, hogy színátmenetes körök legyenek egyéni színekkel és nekem támadnátok valami éles és fájdalmas eszközzel, hadd könnyítsem meg az életünket egy kis elmélettel.

Ezek az adatok tulajdonképpen nem sokban különböznek egymástól. Minden kör összesen 4 darab `float` típusú adattaggal írható le. A köröket tudjuk azonosítani egy számmal (az első kör lehet a 0 a második az 1 stb.), ezzel tudjuk megmondani, hogy melyik körről beszélünk:

```Java
void setup() {
    ...
    float korX0 = random(width);
    float korY0 = random(height);
    float sebX0 = random(-10, 10);
    float sebY0 = random(-10, 10);
    ...
}
```

Ez mind szép és jó, de min javítottuk a kódon? Ezzel a szemlélettel láthatjuk hogy valamilyen ciklusos módszerrel tudhatunk könnyíteni a kódon. Azonban a gondunk még mindig fennáll: nem tudjuk kompaktan tárolni az adatokat.

Ennek a problémának a feloldására találták ki a programozók a tömböket. A töbök feladata, hogy a memóriában ugyanolyan típusú objektumokat közel tároljon egymáshoz. Ezzel az objektumok elérése gyors lesz, és a programozónak nem kell külön neveket adni mindegyiknek.

Amikor létrehozunk egy tömböt, meg kell adnunk, hogy milyen típusú adatokat fogunk benne tárolni, hogy mi a tömbnek a neve, illetve, hogy hány elemet szándékozunk majd beletenni:

```Java
int kiralySzamok[] = new int[2];
```

Miután ez sikerült, a tömbünknek al alábbi módon tudunk az egyes elemeire hivatkozni:

```Java
int kiralySzamok[] = new int[2];

kiralySzamok[0] = 7;
kiralySzamok[1] = 42;

println(kiralySzamok[0]);
println(kiralySzamok[1]);

println(kiralySzamok.length)
```

A tömb elemekre érdemes lehet egyéni változókként gondolni.

A tömbökön a legegyszerűbb egy for ciklussal végiggyalogolni.

```Java
String kedvencKajaim[] = new String[3];
kedvencKajaim[0] = "PIZZA";
kedvencKajaim[1] = "BURGER";
kedvencKajaim[2] = "RANTOTTA";

for(int i = 0; i < kedvencKajaim.length; ++i) {
  println(kedvencKajaim[i]);
}
```

Oldjuk hát meg az eredeti feladatot!

```Java
float korokX[] = new float[30];

void setup() {
  size(800, 600);
  allitsdBeAKoroket();
  rajzoljKoroket();
}

void allitsdBeAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    korokX[i] = random(width);
  }
}

void rajzoljKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    ellipse(korokX[i], 0, 50, 50);
  }
}
```

```Java
float korokX[] = new float[30];
float korokY[] = new float[30];

void setup() {
  size(800, 600);
  allitsdBeAKoroket();
  rajzoljKoroket();
}

void allitsdBeAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    korokX[i] = random(width);
    korokY[i] = random(height);
  }
}

void rajzoljKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    ellipse(korokX[i], korokY[i], 50, 50);
  }
}
```

```Java
float korokX[] = new float[30];
float korokY[] = new float[30];
float sebX[] = new float[30];
float sebY[] = new float[30];

void setup() {
  size(800, 600);
  allitsdBeAKoroket();
  background(#000000);
}

void draw() {
  background(#000000);
  rajzoldAKoroket();
  frissitsdAKoroket();
}

void allitsdBeAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    korokX[i] = random(width);
    korokY[i] = random(height);
    sebX[i] = random(-10, 10);
    sebY[i] = random(-10, 10);
  }
}

void rajzoldAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    ellipse(korokX[i], korokY[i], 50, 50);
  }
}

void frissitsdAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    korokX[i] += sebX[i];
    korokY[i] += sebY[i];
  }
}
```

```Java
void frissitsdAKoroket() {
  for (int i = 0; i < korokX.length; ++i) {
    if(i % 2 == 0) {
      korokX[i] += sebX[i];
      korokY[i] += sebY[i];
    }
  }
}
```

Órai feladatok: 

 - Oldjuk meg hogy ezek a körök visszapattanjanak a falakról.
 - Sakktábla rajzolása közösen.