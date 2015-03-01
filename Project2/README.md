
# Flappy Bird

A második projekt aminek az elkészatését bemutatjuk nektek a Flappy Bird. A projektre várhatóan 3 hetet kell szánni. Javasolt lépések az alábbiak:

 1. Madár elkészítése
 2. Oszlopok hozzáadása
 3. Ütközések
 4. Játék vége, kozmetika

Az alábbi kód szolgáljon mindenki számára egy kiindulópontként. Mentoroknak javasolt lehet átvenni, hogy tudják, hogy minek kellene lenni a végső játéknak. Ha ezt az anyagot tanulóként olvasod, akkor javaslom a kód elolvasását későbbre tolni, előtte az egyes részek megoldására koncentrálni. Ha a tananzag szerint haladtatok, akkor minden tudásotoknak meg kell lenni ahhoz, hogy megoldjátok az összes részt.

### A Madár

A madár elkészítéséhez már majdnem minden kódot megírtunk. Javasolt a gravitáció és a sebesség fogalmának az átvétele.

> Sebesség: az út időbeni változása. Az út ebben az esetben a madárnak a zuhanása. Az idő pedig frameben értendő. 
Mit jelent ez? Minden frameben hozzáadunk a pozícióhoz valamennyit.

> Gyorsulás: a sebesség időbeni változása.
Mit jelent ez? Minden frameben hozzáadunk a sebességhez valamennyit.

Ezek alapján a feladat gyeerekjáték. Próbáljuk meg a feladatot minnél modulárisabban, függvényekre bontva megvalósítani. Az alábbi megoldás megfelelő lehet kiindulási pontnak. Ha nem jut rá idő, akkor csináljátok meg házinak a függvényekbe való kiemelést.

```Java
float madarX;
float madarY;
float madarSebesseg;
float madarMeret;

float GRAVITACIO = 0.3;

void setup() {
  size(800, 600);
  
  madarX = 50;
  madarY = height/4;
  madarSebesseg = 0;
  madarMeret = 50;
}

void draw() {
  background(#FFFFFF);
  madarRajzol();
  madarFrissit();
}

void madarRajzol() {
  fill(#00FFFF);
  ellipse(madarX, madarY, madarMeret, madarMeret);
}

void madarFrissit() {
  madarY += madarSebesseg;
  madarSebesseg += GRAVITACIO;
}
```

Ha mindezzel megvagyunk akkor bevezethetjük az ugrálást. Ehhez a `keyPressed` beépített Processing függvényt fogjuk alkalmazni. 
Van `keyPressed` boolean is, mint a `mousePressed`. Ne ezt használjuk, mert nem fog 100% működni, másrészt esetleg nehezebb lesz váltani, ha majd több gombot kell használni.

```Java
void keyPressed() {
  if (key == ' ' ) {
    ...
  }
}
```

Az, hogy az ugrás milyen billentűre/eseményre történjen a saját döntése mindenkinek.

Javaslom a kísérletesét. Nem feltétlen ez a megoldás lesz mindenkinek a legjobb, illetve nem feltétlen ezek a számok lesznek a legjobbak.

```Java
...
float UGRAS_SEBESSEG = 5;

void setup() {
  ...
}

void draw() {
  ...
}

void keyPressed() {
  if (key == ' ') {
    madarSebesseg = -UGRAS_SEBESSEG;
  }
}
```

Aki gyors/házi:
	rajzolás kiemelése
	változók léptetésének kiemelése
	madár meghal, ha kimegy(loop/noloop vagy globális változó vagy ...) lásd 4. pont
	madár kidolgozása
	játék a számokkal -- legyen "jó" a madár repdesése

### Oszlopok

Az oszlopok megvalósításánál elvárás, hogy többet lássunk egyszerre a képernyőn. Javasolt először egy magányos oszlopot kiereszteni az éterbe, majd figyelni a mozgását, lefejleszteni a logikákat amiket kitalálunk. Ha ez sikeres volt, akkor be lehet hozni a több oszlopos megoldásokat. Ehhez tömboket kell majd használni.

Ha nem megy az újrahasznosítás, akkor vehetünk egy nagy oszlop tömböt is, de jó lenne ha inkább a kisebb tömbbe töltődnének bele újra az elemek. A mintafeladatban példát lehet találni erre, de a legelegánsabb megoldás az, ha az utolsó aktív oszlophoz mérjük a következőnek a helyzetét. 

> Mentoroknak: A résztvevőket rá lehet vezeni a fent említett megoldásra, de nem tartom célszerűnek. 

Nincsen gond ha itt elidőztök pár alkalmat. Nem egyszerű ez a feladat.

```Java
...
int OSZLOPOK_SZAMA = 3;
float oszlopok[] = new float[OSZLOPOK_SZAMA];
float oszlopResek[] = new float[OSZLOPOK_SZAMA];
float oszlopSebesseg = 5;
float oszlopSzelesseg = 50;

void setup() {
  ...
  for(int i = 0; i < oszlopok.length; ++i) {
    oszlopok[i] = width + i * (width/OSZLOPOK_SZAMA);
    oszlopResek[i] = random(height/4, height/2);
  }
}

void draw() {
  ...
  oszlopRajzol();
  oszlopFrissit(); 
}

...

void oszlopRajzol() {
  for(int i = 0; i < oszlopok.length; ++i) {
    noStroke();
    fill(#FFFF00);
    rect(oszlopok[i], 0, oszlopSzelesseg, oszlopResek[i]);
    rect(oszlopok[i], oszlopResek[i] + height/4, oszlopSzelesseg, height);
  }
}

void oszlopFrissit() {
  for(int i = 0; i < oszlopok.length; ++i) {
    oszlopok[i] -= oszlopSebesseg;
    if (oszlopok[i] < -oszlopSzelesseg) {
      oszlopok[i] = width;
    }
  }
}
```

### Ütközés, pontozás, game over

Ha mindent sikerült megvalósítani eddig, akkor már csak az ütközés, a pontok és a game over állapot van hátra a testreszabás és az utolsó simítások előtt.

Az ütközéshez az alábbi feltételeket kell vizsgálni:

 - A madár egy oszlop vonalában van e vízszintesen
 - A madár nincs e egy rés vonalában függőlegesen

A feladat remek a logikai feltételek frissítésére. Javasolt a feltételeket változókba kiemelni, hogy a kód minnél olvashatóbb legyen.

A pontszerzésre az alábbi példában egz elég primitív algoritmus van: amikor eltűnik egy oszlop, akkor kapunk egy pontot. Mint minden, ez sincsen kőbe vésve. Pontosabb megoldásoknak jobban örülünk: ez lehet egz logikai tömb, egz integer tömb, vagz akár egy egyszerű idő alapú pontozás, a játék alkotójának a preferenciáján múlik az egész.

```Java

boolean gameOver = false;
int pontSzam = 0;

...

void madarRajzol() {
  ...
  utkozes();
}

...

void oszlopFrissit() {
  ...
    if (oszlopok[i] < -oszlopSzelesseg) {
      pontSzam += 1;
      oszlopok[i] = width;
    }
  ...
}

...

void utkozes() {
  for (int i=0; i < oszlopok.length; ++i) {
    if (madarX + madarMeret/2 > oszlopok[i] && madarX < oszlopok[i] + oszlopSzelesseg) {
      if (madarY< oszlopResek[i]||madarY + madarMeret/2 > oszlopResek[i] + height/4) {
        gameOver = true;
      }
    }
  }
  if (madarY-madarMeret/2 >= height) {
    gameOver = true;
  }
}

void jatekVege() {
  fill(#000000);
  textSize(72);
  textAlign(CENTER);
  text(pontSzam, width/2, height/2);
}
```

Ezek után minden kötelező résszel kész vagyunk, jöhet az örömködés!

Amiket még meg lehet csinálni, ha maradt volna idő, akkor az alábbi dolgokkal lehet foglalkozni:

 - Kozmetika, képek használata alakzatok helyett. Váltakozó szereplők.
 - Életek
 - Hogyan lehet pár sor kóddal egy teljesen más játékot csinálni belőle?
 - Openprocessingre kitétel

Jó hackelést!