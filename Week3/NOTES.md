# Week 3

## Day 1 - Bool algebra, bevezetes a proceduralis logikaba (milyen tudomanyos)

Elozo alkalmakkal tanultuk, hogy hogyan mukodik a hetkoznapok algebraja a processingben:

```Java
println(1 + 1); // 2
```

Annak erdekeben, hogy komplex utasitasokkal tudjuk elarasztani a programjainkat kenytelenek leszunk bevezetni egy uj tipusu valtozot: a **logikai** valtozokat.

### A boolean tipus

Elso lepeskent egeszitsuk ki a multheti tablazatunkat egy extra sorral:

|Tipus neve|Processing-beli neve|Pelda|
|---|---|---|
|Logikai|boolean|true|

A boolean tipusu valtozoknak erteke lehet `true` vagy `false`. `true` abban az esetben, ha igaz allitast akarunk kifejezni, ellenkezo esetben `false`.

```Java
boolean kekAzEg = true;
println(kekAzEg);

boolean pirosAViz = false; // remeljuk tenyleg
println(pirosAViz);
```

Ez onmagaban nem ad nekunk semmi informaciot. Nezzuk hat milyen muveleteket tudunk rahuzni!

#### Muveletek booleannal

3 alapveto muveletunk van amit ebben a kurzusban hasznalni fogunk:

- **Es**: ha egy es muveletnek valamelyik oldalan hamis van, akkor az eredmeny is hamis lesz. Processing-beli jelolese: `&&`.

```Java
boolean nemIttamKavet = false;
boolean kesonFekudtem = true;

boolean faradtVagyokMintAtom = nemIttamKavet && kesonFekudtem;
println(faradtVagyokMintAtom); // false
```

- **Vagy**: ha egy vagy muveletnek valamelyik oldalan van igaz, akkor az eredmeny is igaz les. Processing-beli jelolese: `||`.

```Java
boolean joKedvemVan = true;
boolean joVoltAKoncert = false;

boolean eppenTapsolok = joKedvemVan || joVoltAKoncert;
println(faradtVagyokMintAtom);//true
```

- **Nem**: unaris logikai muvelet. Ez azt jelenti, hogy egy logikai valtozohoz vagy kifejezeshez tudjuk csatolni, ekkor azt tagadja.  Processing-beli jelolese: `!`.

```Java
boolean szeretemAPizzat = false;

println(!szeretemAPizzat);
```

Ezek mellett vannak muveleteink amikkel osszehasonlitasokat tudunk vegezni. Ezeknek az eredmenye mindig `boolean`.

- **Egyenlo**: ket alapelem egyenloseget vizsgalja. Processing-beli jelolese: `==`.

```Java
boolean szeretekTancolni = false;
int ennyiPalinkatIttam = 2;

boolean tancolok = szeretekTancolni || (ennyiPalinkatIttam == 5);
println(tancolok); // false :(
```

- **Kisebb, nagyobb**: Szerencsere nem csak egyeloseget tudunk vizsgalni.

```Java
int akosKora = 67;
int nyugdijKorhatar = 65;

boolean akosNyugdijas = akosKora >= nyugdijKorhatar;
println(akosNyugdijas); // true
```

Ertlem szeruen nem csak zart intervallumokra tudunk ellenorizni:

```Java
int tasziloMagassaga = 145; // cm
int kotelezoMagassag = 170; // cm

boolean tasziloBeszallhat = kotelezoMagassag < tasziloMagassaga;
// boolean tasziloBeszallhat = tasziloMagassaga > kotelezoMagassag;
println(tasziloBeszallhat); // false
```

Alapjaban veve a logikai muveletek nem bizonyulnak tul hasznosnak. A szamokat legalabb be tudtuk irni a kedvenc `ellipse` parancsunk parameterei koze, de ezzel meg csak ezt sem tudjuk kezdeni...

> **Ahogy az okos matekosok csinaljak**: A bool algebra nem egy mai otlet. Eloszor George Bool irta le a tanulmagyait ebben a temakorben valamikor a 19. szazadban. Alapvetoen halmazelmeletrol beszelunk ahol az "es" muvelet a metszetet, a "vagy" muvelet az uniot takarja. A bool algebranak kiemelkedo szerepe van a digitalis elektronikaban.

### Elagazasok, es logikai kontroll a programunkban

Mindeddig a programjaink esz nelkul vegeztek a feladatokat: Rajzolj ki minden frameben egy kort aminek no a sugara... kovessuk az egeret... mozogjanak a teglalapok... Ezek nem tul erdekes tortenetek. Amikor programot irunk akkor egy dinamikus tortenetet akarunk elmeselni:

> Legyen egy olyan korom ami koveti az egeremet, de legyen az, hogy ha a kepem felso reszeben vagyok, akkor legyen lila, mert azt szeretem. Ha viszont az also reszeben vagyok, akkor legyen sarga, mert azt nem.

Az okos programozok 1000 eve kitalaltak egy modszert erre, amit elagazasoknak neveznek, az alabbiak az alapveto elemei:

```Java
if(/* logikai feltetel */) {
    // ha a logikai feltetel igaz, akkor az itteni kodsor lefut
} else if(/* logikai feltetel, amit akkor nezunk meg ha az elozo(k) nem jottek be */) {
    // ha az elso if nem jott be, de az e folotti logikai feltetel igaz, akkor ez fut le
} else {
    // ha semmi nem jott volna ossze a fentiek kozul
}
```

Nem kell feltetlen minden elemnek szerepelnie a fent felsoroltak kozul. Azert az if az kell

Ezek alapjan nem olyan nezez megcsinalni a fenti feladatot.

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

Nem volt tul nehez. Probaljuk meg a szamokat manipulalni! Ha lenyomjuk az egergombot, akkor nojjon a negyzet szelessege!. Kulonben ne tudtenjen semmi.

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

> A `mousePressed` esemeny visszaad egy igazat vagy egy hamisat attol fuggoen, hogy le van e nyomva valamilyen gomb az egeren, vagy nincs. Vannak hasonlok a billentyuzetekre is, ezekkel kesobbi alkalmakkor fogunk megismerkedni.

Egeszitsuk ki a programot azzal, hogy ha a negyzetunk oldala eleri a kep szelesseget, akkor befele haladjon lenyomaskor.

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

Ekkor megjelennek a programunkban az allapotok. Ez egy eleg egyszeru program, ket allapottal rendelkezik. Egyszer novekedunk, egyzer meg csokkenunk. A csokkenes es novekedes allapotat az hatarozza meg, hogy milyen szeles a negyzetunk oldala.

Keszitsunk egy labdat ami visszapattan a falrol:

1. Induljon el egy labda valamilyen iranyba veletlen helyrol veletlen sebsseggel.

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

2. Talaljuk ki, hogy mit jelent az hogy visszapattan a falrol.

Koppanunk a falon = elerjuk a szelet a kepnek!

Visszapattanunk = -1-el megszorozzuk a megfelelo iranyt. Ha vizszintes az utkozes akkor az x sebesseget, ha fuggoleges akkor az y-t. Feltetelezzuk, hogy tokeletesen rugalmas az univerzum.

3. Fejlesszuk le a visszapattanast.

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

1. Valositsunk eg egy ejjel-nappal ciklust a mi kis hazikos hazinkban.

Szorgi:A gravitacios peldaban gondoljuk at hogy a visszapattanas az mit jel
