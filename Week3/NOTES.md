# Week 3

## Day 1 - Bool algebra, bevezetés a procedurális logikába (milyen tudományos)

Előző alkalmakkal tanultuk, hogy hogyan működik a hétkoznapok algebrája a processingben:

```Java
println(1 + 1); // 2
```

Annak érdekeben, hogy komplex utasytásokkal tudjuk elárasztani a programjainkat kénytelenek leszünk bevezetni egy új típusú változót: a **logikai** változókat.

### A boolean típus

Első lépésként egészítsük ki a múltheti táblázatunkat egy extra sorral:

|Típus neve|Processing-beli neve|Példa|
|---|---|---|
|Logikai|boolean|true|

A boolean típusú változóknak értéke lehet `true` vagy `false`. `true` abban az esetben, ha igaz állítíst akarunk kifejezni, ellenkező esetben `false`.

```Java
boolean kekAzEg = true;
println(kekAzEg);

boolean pirosAViz = false; // remeljuk tenyleg
println(pirosAViz);
```

Ez önmagában nem ad nekünk semmi információt. Nézzük hát milyen műveleteket tudunk ráhúzni!

#### Műveletek booleannal

3 alapvető műveletünk van amit ebben a kurzusban használni fogunk:

- **Es**: ha egy es műveletnek valamelyik oldalán hamis van, akkor az eredmény is hamis lesz. Processing-beli jelölése: `&&`.

```Java
boolean nemIttamKavet = false;
boolean kesonFekudtem = true;

boolean faradtVagyokMintAtom = nemIttamKavet && kesonFekudtem;
println(faradtVagyokMintAtom); // false
```

- **Vagy**: ha egy vagy műveletnek valamelyik oldálan van igaz, akkor az eredmény is igaz lesz. Processing-beli jelölése: `||`.

```Java
boolean joKedvemVan = true;
boolean joVoltAKoncert = false;

boolean eppenTapsolok = joKedvemVan || joVoltAKoncert;
println(eppenTapsolok);//true
```

- **Nem**: unáris logikai művelet. Ez azt jelenti, hogy egy logikai változóhoz vagy kifejezéshez tudjuk csatolni, ekkor azt tagadja.  Processing-beli jelölése: `!`.

```Java
boolean szeretemAPizzat = false;

println(!szeretemAPizzat);
```

Ezek mellett vannak műveleteink amikkel összehasonlitásokat tudunk végezni. Ezeknek az eredménye mindig `boolean`.

- **Egyenlő**: két alapelem egyenlősegét vizsgálja. Processing-beli jelölése: `==`.

```Java
boolean szeretekTancolni = false;
int ennyiPalinkatIttam = 2;

boolean tancolok = szeretekTancolni || (ennyiPalinkatIttam == 5);
println(tancolok); // false :(
```

- **Kisebb, nagyobb**: Szerencsére nem csak egyemlőséget tudunk vizsgálni.

```Java
int akosKora = 67;
int nyugdijKorhatar = 65;

boolean akosNyugdijas = akosKora >= nyugdijKorhatar;
println(akosNyugdijas); // true
```

Értelemszerűen nem csak zárt intervallumokra tudunk ellenőrizni:

```Java
int tasziloMagassaga = 145; // cm
int kotelezoMagassag = 170; // cm

boolean tasziloBeszallhat = kotelezoMagassag < tasziloMagassaga;
// boolean tasziloBeszallhat = tasziloMagassaga > kotelezoMagassag;
println(tasziloBeszallhat); // false
```

Alapjában véve a logikai műveletek nem bizonyulnak túl hasznosnak. A számokat legalább be tudtuk irni a kedvenc `ellipse` parancsunk paraméterei közé, de ezzel meg csak ezt sem tudjuk kezdeni...

> **Ahogy az okos matekosok csinálják**: A bool algebra nem egy mai ötlet. Először George Bool írta le a tanulmányait ebben a témakörben valamikor a 19. században. Alapvetően halmazelméletről beszélünk ahol az "és" művelet a metszetet, a "vagy" művelet az uniót takarja. A bool algebranak kiemelkedő szerepe van a digitális elektronikában.

### Elágazások, és logikai kontroll a programunkban

Mindeddig a programjaink ész nélkul végezték a feladatokat: Rajzolj ki minden frameben egy kört aminek nő a sugara... kövessuk az egeret... mozogjanak a téglalapok... Ezek nem túl érdekes történetek. Amikor programot írunk akkor egy dinamikus törtenetet akarunk elmesélni:

> Legyen egy olyan köröm ami követi az egeremet, de legyen az, hogy ha a képem felső részében vagyok, akkor legyen lila, mert azt szeretem. Ha viszont az alsó részében vagyok, akkor legyen sárga, mert azt nem.

Az okos programozók 1000 éve kitaláltak egy módszert erre, amit elágazásoknak neveznek, az alábbiak az alapvető elemei:

```Java
if(/* logikai feltétel */) {
    // ha a logikai feltétel igaz, akkor az itteni kódsor lefut
} else if(/* logikai feltétel, amit akkor nézunk meg ha az előző(k) nem jöttek be */) {
    // ha az első if nem jött be, de az e fölötti logikai feltétel igaz, akkor ez fut le
} else {
    // ha semmi nem jött volna össze a fentiek közül
}
```

Nem kell feltétlen minden elemnek szerepelnie a fent felsoroltak közüé. Azert az if az kell.

Ezek alapján nem olyan nehéz megcsinálni a fenti feladatot.

```Java
color hatterSzin = #F7EDCD;
color fentiSzin = #52A1FF;
color lentiSzin = #52FFC7;

void setup() {
  size(800, 600);
  background(hatterSzin);
}

void draw() {
  background(hatterSzin);
  
  if(mouseY > (height / 2)) {
    fill(fentiSzin);
  } else {
    fill(lentiSzin);
  }
  
  ellipse(mouseX, mouseY, 100, 100);
}
```

Nem volt tul nehéz. Probáljuk meg a számokat manipulálni! Ha lenyomjuk az egérgombot, akkor nőjjön a négyzet szélessége. Különben ne történjen semmi.

```Java
color hatterSzin = #F7EDCD;

float negyzetOldal = 0;

void setup() {
  size(400, 400);
  
  noFill();
  strokeWeight(10);
  rectMode(CENTER);
  
  background(hatterSzin);
}

void draw() {
  background(hatterSzin);
  
  if(mousePressed) {
    negyzetOldal += 5;
  }
  
  rect(width / 2, height / 2, negyzetOldal, negyzetOldal);
}
```

> A `mousePressed` esemény visszaad egy igazat vagy egy hamisat attol függően, hogy le van-e nyomva valamilyen gomb az egéren, vagy nincs. Vannak hasonlók a billentyűzetekre is, ezekkel kesőbbi alkalmakkor fogunk megismerkedni.

Egészítsük ki a programot azzal, hogy ha a négyzetünk oldala eléri a kép szélességét, akkor befele haladjon lenyomáskor.

```Java
color hatterSzin = #F7EDCD;

float negyzetOldal = 0;
boolean novekedunk = true;

void setup() {
  size(400, 400);
  
  noFill();
  strokeWeight(10);
  rectMode(CENTER);
  
  background(hatterSzin);
}

void draw() {
  background(hatterSzin);
  
  if(negyzetOldal == 0) {
    novekedunk = true;
  } else if(negyzetOldal == height) {
    novekedunk = false;
  }
  
  if(novekedunk && mousePressed) {
    negyzetOldal++;
  } else if(!novekedunk && mousePressed) {
    negyzetOldal--;
  }
  
  rect(width / 2, height / 2, negyzetOldal, negyzetOldal);
}
```

Ekkor megjelennek a programunkban az állapotok. Ez egy elég egyszerű program, két állapottal rendelkezik. Egyszer növekedünk, egyszer meg csökkenünk. A csökkenés és növekedés állapotát az határozza meg, hogy milyen széles a négyzetünk oldala.

Készitsünk egy labdát ami visszapattan a falról:

1. Induljon el egy labda valamilyen irányba véletlen helyről véletlen sebsséggel.

```Java
float korX;
float korY;

float iranyX;
float iranyY;

color hatter = #F7EDCD;

void setup() {
  size(800, 800);
  
  korX = random(width);
  korY = random(height);
  
  iranyX = random(-5, 6);
  iranyY = random(-5, 6);
  
  background(hatter);
}

void draw() {
  background(hatter);
  
  ellipse(korX, korY, 75, 75);
  
  korX += iranyX;
  korY += iranyY;
}
```

2. Találjuk ki, hogy mit jelent az hogy visszapattan a falról.

Koppanunk a falon = elérjuk a szélét a képnek!

Visszapattanunk = -1-el megszorozzuk a megfelelő irányt. Ha vízszintes az ütkozés akkor az x sebességet, ha függőleges akkor az y-t. Feltételezzük, hogy tökeletesen rugalmas az univerzum.

3. Fejlesszuk le a visszapattanást.

```Java
float korX;
float korY;

float iranyX;
float iranyY;

color hatter = #F7EDCD;

void setup() {
  size(400, 375);
  
  korX = random(width);
  korY = random(height);
  
  iranyX = random(-5, 6);
  iranyY = random(-5, 6);
  
  background(hatter);
}

void draw() {
  background(hatter);
  
  ellipse(korX, korY, 75, 75);
  
  if(korX > width || korX < 0) {
    iranyX *= -1;
  }
  
  if(korY > height || korY < 0) {
    iranyY *= -1;
  }
  
  korX += iranyX;
  korY += iranyY;
}
```

4. ???

5. Profit!

## HF:

1. Valósitsunk meg egy éjjel-nappal ciklust a mi kis házikós házinkban.

Szorgi:A gravitációs példában gondoljuk át hogy a visszapattanás az mit jelent.
