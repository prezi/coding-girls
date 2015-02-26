
# Week 2

## Day 1

### Változók

Mi az a változó?

Képzeljünk el két ketrecet. Az egyikbe csak egy macska, a másikba csak egy kutya fér bele. Ezekből a ketrecekből lehet több darab is, egy állatmenhelyen például a sorszámmal határozzák meg. Bodri a kutyaketrec-1 -ben van, Vahur a kutyaketrec-2 -ben, Cirmos pedig a macskaketrec-1 -ben. 

Ugyanígy megy ez a programozásban is, csak különleges szavakkal: 

- a kutya vagy a macska a **_típus_** 
- a kutyaketrec-1, a kutyaketrec-2 vagy a macskaketrec-1 a **_változó_**
- Bodri, Vahur és Cirmos pedig az **_érték_**

Azért nevezzük változónak, mert a tartalma változhat: Bodri holnap lehet, hogy a kutyaketrec-2 -ben lesz. 

#### Milyen beépített típusok vannak?

|Típus neve|Processing-beli neve|Példa|
|---|---|---|
|Egész szám|int|42|
|Lebegőpontos szám|float|3.14|
|Karakter|char|'a'|
|Szöveg|String|"Coding Girls"|

#### Hogyan csinálunk változókat?

A formula egyszerű, de nagyszerű:

    - Megmondjuk mi a típusunk
    - Adunk egy nevet a tárolónak

A nevet érdemes sokatmondónak választani. Nem baj ha túl hosszú, a cél, hogy aki olvassa a kódot az tudja hogy miről van szó!

    - Tegyünk egy egyenlőség jelet (=). Ezzel jelöljük, hogy ebbe a változóba értéket szeretnénk rakni
    - Adjuk meg az érteket amit be akarunk tölteni.
    - Ez egy utasítás, nem felejtjük le a pontosvesszőt!

Példa:
```Java

// Rögtön adok egy érteket a kedvenc számomnak, mivel nagyon szeretem.
// Figyeljünk a sokatmondó vátozónevekre!
int kedvencSzamom = 7;

// Nem feltétlen kell azonnal értéket adnunk egy változónak. Így csak jelezzük a Processingnek, hogy majd szükségünk lesz rá.
float ennekNemAdokAzonnalErteket;

String kedvencKajam = "Pizza";

// Itt nem adtam neki típust, mivel már létrehoztam korábban ezt a változót. Többször nem kell.
ennekNemAdokAzonnalErteket = 3.1415972;
```

### println

Programozók fontos eszköze. Sokszor nem tudjuk, hogy számilag mi is történik a háttérben. Főleg ha több száz változóm van.

Cél: a programban lévő események követése szemmel.

```Java
void setup() {
  
  // Szám
  println(1337);
  
  // Lebegőpontos (tizedesjegyes) szám
  println(3.14);
  
  // Szöveg
  println("Hello-Bello");
  
  // Egy betű
  println('c');

  // Egy változó
  int nagyonNagySzam = 102;
  println(nagyonNagySzam);
   
}
```

### Műveletek számokkal

(Majdnem)minden játszik amit csak el tudtok képzelni matekóráról. Nezzuk az `int`-eket:

```Java
// Általános -1.: összeadás
int egyJopofaSzam = 6;
int ketJopofaSzamOsszege = egyJopofaSzam + 28;
println(ketJopofaSzamOsszege); // nagyon remeljuk, hogy 34. ami nem annyira jopofa

// Általános 0.: kivonás
int vanEnnyiAlmam = 12;
int megettemBeloleEnnyit = 36;
int ennyiAlmamMaradt = vanEnnyiAlmam - megettemBeloleEnnyit; // megjegyzes: dinnyevel is mukodik
println(ennyiAlmamMaradt);

// Lehet ezt rövidebben is, ha azt akarom, hogy az eredeti valtozóm értéke változzon. Nagyon magyar.
vanEnnyiAlmam -= megettemBeloleEnnyit; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam - megettemBeloleEnnyit
vanEnnyiAlmam += megettemBeloleEnnyit; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam + megettemBeloleEnnyit

// Az 1-gyel való növelésre és csökkentésre is van gyorsgomb!
--vanEnnyiAlmam; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam - 1
++vanEnnyiAlmam; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam + 1
```

Itt érdemes megállni egy kicsit, és megbeszélni hogy ennek miért van értelme? Mert matekórán ugye azt tanítják, hogy ha x = x - 1, abból következik, hogy 0 = -1. Tehát fontos emlékezni, hogy ami a jobb oldalon van írva, az történik először, és az egyenlőség jele valójában nem egyenlőséget jelent, hanem értékadás.

```Java

// Még mindig általános 0.: szorzás.
int elegKisFaktorialis = 1 * 2 * 3 * 4 * 5 * 6;

// Általános 0.5.: osztás
int legkisebbPrimszam = 16 / 8;

// Azért nem olyan triviális: egészt egésszel osztva egészet kapunk!
println(9 / 2);
```

A különbség `int` és `float` között, istenigazán, csak az osztásban van műveletek szempontjából:

```Java
// Szerencsére itt nem egészet fogunk visszakapni.
float ketSzuperSzamHanyadosa = 3.141592 / 2.718781; // pi / e
println(ketSzuperSzamHanyadosa);
```

### Automatikusan mozgó alakzatok

Végre vége az elméletnek! Jöhet a mókázás!

Mire is jó nekünk a változó? A változókat felhasználhatjuk például egy körnek a paramétereként:

```Java
void setup() {
    size(800, 600);

    int kepKozepeX = 800 / 2;
    int kepKozepeY = 600 / 2;

    ellpise(kepKozepeX, kepKozepeY, 50, 50);
}
```

Miért is jó ez? Ugye tanultuk, hogy a `draw` függvény folytonfolyvást meghívódik egymás után. Egy ilyen meghívást **frame**-nek nevezünk az informatikában. Emellé a kifejezés mellé párosul a **frame rate**, ami azt takarja, hogy másodpercenként hányszor frissül a képernyő. A mi esetünkben pedig azt jelenti, hogy hányszor hívódik meg a `draw()` másodpercenként.

> Emlékeztek rá amikor Stephen Jackson Hobbitját megnéztétek a mozikban? Valószínüleg fájt a fejetek utána, mivel radikálisan **48**-as frame rate-tel játszottak le a filmet a megszokott 24-25 helyett.

Elkalandoztam. Szóval ez azért jó nekünk, mert ha a `draw()`-ban végzünk változtatásokat egy változón, akkor az mindig életbe fog lépni! Nézzünk egy egyszerű példát:

```Java
int korAtmeroje = 0;

void setup() {
    size(800, 600);
    background(#FFFFFF);
}

void draw() {
    background(#FFFFFF);
    ellipse(width/2, height/2, korAtmeroje, korAtmeroje)
    ++korAtmeroje;
}
```

> Nem, nem csaltam. Miután beállítottuk a `size()` függvénnyel a vászon méretet, a `width` es `height` változók automatikusan beállítódnak, és tudjuk őket használni bárhol a kódban.

Hasonlóan itt egy másik példa:

```Java
int ellipszisAtmerojeX = 0;
int ellipszisAtmerojeY = 600;

void setup() {
    size(800, 600);
    background(#FFFFFF);
}

void draw() {
    background(#FFFFFF);
    ellipse(width/2, height/2, ellipszisAtmerojeX, ellipszisAtmerojeY);
    ++ellipszisAtmerojeX;
    --ellipszisAtmerojeY;

    // mekkora az ellipszis területe?
    println(PI * ellipszisAtmerojeX / 2 * ellipszisAtmerojeY / 2);
}
```

### A véletlenség szépségei

A Processing alkalmas arra, hogy véletlenszerű számokat adjon vissza nekünk egy `random` nevezetű metódus segítségével. Egészen jópofa dolgokat lehet vele csinálni:

```Java
int negyzetCsucsaX;
int negyzetCsucsaY;

void setup() {
    size(800, 600);
    background(#FFFFFF);

    negyzetCsucsaX = width / 2;
    negyzetCsucsaY = height / 2;
}

void draw() {
    background(#FFFFFF);
    rect(negyzetCsucsaX, negyzetCsucsaY, 50, 50);
    
    // random(10) visszaad egy számot 0 es 9 közözt
    negyzetCsucsaX += random(10) - 5;
    negyzetCsucsaY += random(10) - 5;
}
```

> Ahogy a műveszek csinálják: A `random` egy elég nyers funkció. Általában gyakorlatban a `noise` függvényt használjak. Mi nem fogjuk, de akit érdekel utánajárhat!

### A color és image típusok

Van meg két fontos típus, amit sokat fogunk használni. Az egyik a `PImage`, ami képek tárolasára alkalmas. A másik a `Color`, ami pedig színekére.

#### PImage

A képeket letölthetjük az internetről. Ekkor a Processing minden futtatás eléjen letölti a képet a memóriába.

```Java
PImage viccesMacskasKep;

void setup() {
    size(415, 480);
    viccesMacskasKep = loadImage("http://o-cat.net/wp-content/uploads/2014/03/funnycat2.jpg");
    image(viccesMacskasKep, 0, 0);
}
```

> Legyünk okosak! A `draw`-ba ne tegyünk képletöltést, mert nem olcsó dolog letölteni egy képet minden frame-ben!

A képeket betölthetünk a fájlrendszerből is. Ekkor létre kell hoznunk egy `data` könyvtárat a pde file mellett, és oda kell helyezni a fájlt. 

> Ezt a könyvtárlétrehozást és képmásolást megteszi a processing helyettünk, ha az egérrel valahonnan "behúzzuk" a képet. Angolul ezt a műveletet _drag and drop_-nak nevezik.

```Java
PImage viccesKutyasKep;

void setup() {
    size(640, 480);
    viccesKutyasKep = loadImage("https://malialitman.files.wordpress.com/2014/06/funny-dog-one.jpg");
    image(viccesKutyasKep, 0, 0);
}
```

#### color

Color változóba tudjuk menteni a színeinket.

```Java
color azEgSzine = #82A1DB;
void setup() {
    bacground(azEgSzine);
}
```

### Egérkövető

Feladat: csináljunk egy olyan programot, ahol egy kép (vagy alakzat, pl. kör) örömmel követi a kurzorunkat. Ez alapjában véve nem lenne nehéz, így a célunk az lesz, hogy "smooth" legyen a követés.

Rendicsek. Legyünk okos programozók, és probáljuk meg lépésről lépésre megoldani a problémát. Kezdjük mondjuk azzal amit elvárunk végeredményként: legyen a kör középpontja az egér pozíciója.
```Java
color hatterSzin = #A8E0CE;
color korSzin = #A8BBE0;

void setup() {
  size(640, 480);
  background(hatterSzin);
}

void draw() {
  background(hatterSzin); 
  fill(korSzin);
  ellipse(mouseX, mouseY, 50, 50);
}
```

Ez nem volt túl izzasztó. Mivel a kör középpontja változni fog majd az idővel, ezért lehet érdemes lenne kiemelni egy változóba.
```Java
color hatterSzin = #A8E0CE;
color korSzin = #A8BBE0;

void setup() {
  size(640, 480);
  background(hatterSzin);
}

void draw() {
  background(hatterSzin); 

  korX = mouseX;
  korY = mouseY;
 
  fill(korSzin);
  ellipse(korX, korY, 50, 50);
}
```

Szuper, mostmár elkezdhetunk vele számolgatni. Mit is akarunk majd? Hogy a kör közepe valahogy változzon az egér pozíciójához képest.
```Java
color hatterSzin = #A8E0CE;
color korSzin = #A8BBE0;

int korX;
int korY;

void setup() {
  size(640, 480);
  background(hatterSzin);
}

void draw() {
  background(hatterSzin);
  
  korX += (mouseX - korX);
  korY += (mouseY - korY);
  
  fill(korSzin);
  ellipse(korX, korY, 50, 50);
}
```

Mit is csináltunk? A kör közepe mindig növekedni fog az egér középpontjának es a kör közepének a különbségével. Ha a különbség 0, akkor a kettő pont ugyanazon a ponton van. Ez minden 2. frameben igaz is lesz, ha átgondoljuk egy picit. Így gyakorlatilag van egy olyan programunk, ahol a kör középpontja szinte rögtön odaugrik az egérre. Lassítsuk hát le!
```Java
color hatterSzin = #A8E0CE;
color korSzin = #A8BBE0;

int korX;
int korY;

int kovetesiHanyados = 16;

void setup() {
  size(640, 480);
  background(hatterSzin);
}

void draw() {
  background(hatterSzin);
  
  korX += (mouseX - korX) / kovetesiHanyados;
  korY += (mouseY - korY) / kovetesiHanyados;
  
  fill(korSzin);
  ellipse(korX, korY, 50, 50);
}
```

A követési hányados fogja meghatározni, hogy mennyire követjük gyorsan az egeret. Matek.


### Házi feladat

1. Fejlesszük tovább a korábbi házinkat! Mozogjon a nap automatikusan. Nem kell még azzal foglalkozni, hogy eltűnik a képernyőről. **BONUS**: Mozogjanak a felhők is automatikusan. 
2. Szeretjük a véletlen számokat. Fejlesszünk egy olyan programot, ami jol demonstrálja hogy milyen véletlenséggel mozognak az alakzatok! Legyen több mozgó elemünk. **BONUS**: Gondolkozzunk el rajta, hogy hogy lehetne a vásznon jelölni a mozgást.

Szorgalmi: 

1. Lehetne valahogy gravitációt szimulálni az eddig tanultakkal?
2. Nézzétek meg a `noise` függvényt, és próbaljátok meg felhasználni valamilyen mozgásnal. Tipp: akkor lesz harmonikus, ha valamilyen korábbi változót használtok fel paraméterként.
