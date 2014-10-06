
# Week 2

## Day 1

### Valtozok

Mi az a valtozo?

Kepzeljunk el ket ketrecet. Az egyikbe csak egy macska, a masikba csak egy kutya fer bele. Ezekbol a ketrecekbol lehet tobb darab is, egy allatmenhelyen peldaul a sorszammal hatarozzak meg.

```Processing
Kutyaketrec 0001 = kutya1;
Kutyaketrec 0002 = kutya2;
Macskaketrec 0001 = macska1;
```

Ugyanigy megy ez a programozasban is. Ennel kicsit konkretabb adatokkal (de ez nem akadalyoz minket meg abban, hogy legyen kutya vagy macska tipusunk).

#### Milyen beepitett tipusok vannak?

|Tipus neve|Processing-beli neve|Pelda|
|---|---|---|
|Egesz szam|int|42|
|Lebegopontos szam|float|3.14|
|Karakter|char|'a'|
|Szoveg|String|"Coding Girls"|

#### Hogyan csinalunk valtozokat?

A formula egyszeru, de nagyszeru:

    - Megmondjuk mi a tipusunk
    - Adunk egy nevet a tarolonak

        A nevet erdemes sokatmondonak valasztani. Nem baj ha tul hosszu, a cel, hogy aki olvassa a kodot az tudja, hogy mirol van szo!

    - Tegyunk egy egyenloseg jelet (=). Ezzel jeloljuk, hogy ebbe a valtozoba erteket szeretnenk rakni
    - Adjuk meg az erteket amit be akarunk tolteni.
    - Ez egy utasitas, nem felejtjuk le a pontyosvesszot!

Pelda:
```Java

// Rogton adok egy erteket a kedvenc szamomnak, mivel nagyon szeretem.
// Figyeljunk a sokatmondo vatozonevekre!
int kedvencSzamom = 7;

// Nem feltetlen kell azonnal erteket adnunk egy valtozonak. Igy csak jelezzuk a Processingnek, hogy majd szuksegunk lesz ra.
float ennekNemAdokAzonnalErteket;

String kedvencKajam = "Pizza";

// Itt nem adtam neki tipust, mivel mar letrehoztam korabban ezt a valtozot. Tobbszor nem kell.
ennekNemAdokAzonnalErteket = 3.1415972;
```

### println

Programozok fontos eszkoze. Sokszor nem tudjuk, hogy szamilag mi is tortenik a hatterben. Foleg ha tobb szaz valtozom van.

Cel: a programban levo esemenyek kovetese szemmel.

```Java
void setup() {
  
  // Szam
  println(1337);
  
  // Lebegopontos (tizedesjegyes) szam
  println(3.14);
  
  // Szoveg
  println("Hello-Bello");
  
  // Egy betu
  println('c');

  // Egy valtozo
  int nagyonNagySzam = 102;
  println(nagyonNagySzam);
   
}
```

### Muveletek szamokkal

(Majdnem)minden jatszik amit csak el tudtok kepzelni matekorarol. Nezzuk az `int`-eket:

```Java
// Altalanos -1.: osszeadas
int egyJopofaSzam = 6;
int ketJopofaSzamOsszege = egyJopofaSzam + 28;
println(ketJopofaSzamOsszege); // nagyon remeljuk, hogy 34. ami nem annyira jopofa

// Altalanos 0.: kivonas
int vanEnnyiAlmam = 12;
int megettemBeloleEnnyit = 36;
int ennyiAlmamMaradt = vanEnnyiAlmam - megettemBeloleEnnyit; // megjegyzes: dinnyevel is mukodik
println(ennyiAlmamMaradt);

// Lehet ezt rovidebben is, ha azt akarom, hogy az eredeti valtozom erteke valtozzon. Nagyon magyar.
vanEnnyiAlmam -= megettemBeloleEnnyit; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam - megettemBeloleEnnyit
vanEnnyiAlmam += megettemBeloleEnnyit; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam + megettemBeloleEnnyit

// Az 1-el valo novelesre es csokkentesre is van gyorsgomb!
--vanEnnyiAlmam; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam - 1
++vanEnnyiAlmam; // ugyanaz mint: vanEnnyiAlmam = vanEnnyiAlmam + 1

// Meg mindig altalanos 0.: szorzas.
int elegKisFaktorialis = 1 * 2 * 3 * 4 * 5 * 6;

// Altalanos 0.5.: osztas
int legkisebbPrimszam = 16 / 8;

// Azert nem olyan trivialis: egeszt egesszel osztva egeszet kapunk!
println(9 / 2);
```

A kulonbseg `int` es `float` kozott istenigazan csak az osztasban van muveletek szempontjabol:

```Java
// Szerencsere itt nem egeszet fogunk visszakapni
float ketSzuperSzamHanyadosa = 3.141592 / 2.718781; // pi / e
println(ketSzuperSzamHanyadosa);
```

### Automatikusan mozgo alakzatok

Vegre vege az elmeletnek! Johet a mokazas!

Mire is jo nekunk a valtozo? A valtozokat felhasznalhatjuk peldaul egy kornek a parameterekent:

```Java
void setup() {
    size(800, 600);

    int kepKozepeX = 800 / 2;
    int kepKozepeY = 600 / 2;

    ellpise(kepKozepeX, kepKozepeY, 50, 50);
}
```

Miert is jo ez? Ugye tanultuk, hogy a `draw` fuggveny folytonfolyvast meghivodik egymas utan. Egy ilyen meghivast **frame**-nek nevezunk az informatikaban. Emelle a kifejezes melle parosul a **frame rate**, ami azt takarja, hogy masodpercenkent hanyszor frissul a kepernyo, a mi esetunkben pedig azt jelenti, hogy hanyszor hivodik meg a `draw()` masodpercenkent.

> Emlekeztek ra, amikor Stephen Jackson Hobbitjat megneztetek a mozikban? Valoszinuleg fajt a fejetek utana, mivel radikalisan **48**-as frame rattel jatszottak le a filmet a megszokott 24-25 helyett.

Elkalandoztam. Szoval ez azert jo nekunk, mert ha a `draw()`-ban vegzunk valtoztatasokat egy valtozon, akkor az mindig eletbe fog lepni! Nezzunk egy egyszeru peldat:

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

> Nem, nem csaltam. Miutan beallitottuk a `size()` fuggvennyel a vaszon meretet, a `width` es `height` valtozok automatikusan beallitodnak es tudjuk oket hasznalni barhol a kodban.

Hasonloan itt egy masik pelda:

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

    // mekkora az ellipszis terulete?
    println(PI * ellipszisAtmerojeX / 2 * ellipszisAtmerojeY / 2);
}
```

### A veletlenseg szepsegei

A Processing alkalmas arra, hogy veletlenszeru szamokat adjon vissza nekunk egy `random` nevezetu metodus segitsegevel. Egeszen jopofa dolgokat lehet vele csinalni:

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
    
    // random(10) visszaad egy szamot 0 es 9 kozott
    negyzetCsucsaX += random(10) - 5;
    negyzetCsucsaY += random(10) - 5;
}
```

> Ahogy a muveszek csinaljak: A `random` egy eleg nyers funkcio. Altalaban gyakorlatban a `noise` fuggvenyt hasznaljak. Mi nem fogjuk, de akit erdekel utanajarhat!

### A color es image tipus

Van meg ket fontos tipus amit sokat fogunk hasznalni. Az egyik a `PImage`, ami kepek tarolasara alkalmas. A masik a `Color`, ami pedig szinekere.

#### PImage

Kepeket letolthetjuk az internetrol. Ekkor a Processing minden futtatas elejen letolni a kepet a memoriaba.

```Java
PImage viccesMacskasKep;

void setup() {
    size(415, 480);
    viccesMacskasKep = loadImage("http://o-cat.net/wp-content/uploads/2014/03/funnycat2.jpg");
    image(viccesMacskasKep, 0, 0);
}
```

> Legyunk okosak! `draw`-ba ne tegyunk kepletoltest, mert nem olcso dolog letolteni egy kepet minden frameben!

Kepeket betolthetunk a fajlrendzerbol is. Ekkor letre kell hoznunk egy `data` konyvtarat a pde file mellett, es oda kell helyezni a filet.

```Java
PImage viccesKutyasKep;

void setup() {
    size(640, 480);
    viccesKutyasKep = loadImage("https://malialitman.files.wordpress.com/2014/06/funny-dog-one.jpg");
    image(viccesKutyasKep, 0, 0);
}
```

#### color

Color valtozoba tudjuk menteni a szineinket.

```Java
color azEgSzine = #82A1DB;
void setup() {
    bacground(azEgSzine);
}
```

### Egerkoveto

Feladat: csinaljunk egy olyan programot, ahol egy kep (vagy alakzat, pl. kor) orommel koveti a kurzorunkat. Ez alapjaban veve nem lenne nehez, igy a celunk az lesz, hogy "smooth" legyen a kovetes.

Rendicsek. Legyunk okos programozok, es probaljuk meg lepesrol lepesre megoldani a problemat. Kezdjuk mondjuk azzal amit elvarunk vegeredmenykent: legyen a kor kozeppontja az eger pozicioja.
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

Ez nem volt tul izzaszto. Mivel a kor kozeppontja valtoni fog majd az idovel, ezert lehet erdemes lenne kiemelni egy valtozoba.
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

Szuper, mostmar elkezhetunk vele szamolgatni. Mit is akarunk majd? Hogy a kor kozepe valahogy valtozzon az eger poziciojahoz kepest.
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

Mit is csinaltunk? A kor kozepe mindig novekedni fog az eger kozeppontja es a kor kozepenek a kulonbsegevel. Ha a kulonbseg 0, akkor a ketto pont ugyanazon a ponton van. Ez minden 2. frameben igaz is lesz, ha atgondoljuk egy picit. Igy gyakorlatilag van egy olyan programunk, ahol a kor kozeppontja szinte rogton odaugrik az egerre. Lassitsuk hat le!
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

A kovetesi hanyados fogja meghatarozni, hogy mennyire kovetjuk gyorsan az egeret. Matek.


### Hazi feladat

1. Fejlesszuk tovabb a korabbi hazinkat! Mozogjon a nap automatikusan. Nem kell meg azzal foglalkozni, hogy eltunik a kepernyorol. **BONUS**: Mozogjanak a felhok is automatikusan. 
2. Szeretjuk a veletlen szamokat. Fejlesszunk egy olyan programot ami jol demonstralja, hogy milyen veletlenseggel mozognak az alakzatok! Legyen tobb mozgo elemunk. **BONUS**: gondolkozzunk el rajta, hogy hogy lehetne a vasznon jelolni a mozgast.

Szorgalmi: 

1. Lehetne valahogy gravitaciot szimulalni az eddig tanultakkal?
2. Nezzetek meg a `noise` fuggvenyt es probaljatok meg felhasznalni valamilyen mozgasnal. Tipp: akkor lesz harmonikus, ha valamilyen korabbi valtozot hasznaltok fel parameterkent.
