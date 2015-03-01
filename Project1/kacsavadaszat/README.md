# Kacsavadászat

## A játék célja

Kinyírni a kacsákat

## Fejlesztési lépések

### Négyzet a képernyőn

Készítünk egy négyzetet ami véletlenszerűen megjelenik a vásznon.

> Arra kell csak figyelni, hogy a négyzet minen pontja mindig a vásznon belül maradjon. Ehhez tudni kell, hogy a `rectMode` alapértelmezésként az alakzat bal felső sarkát számolja origónak.

```java
// Setupba érdemes rakni, különben flash kacsa lesz :)
kacsaX = random(0, width - kacsaMeret);
kacsaY = random(0, height - kacsaMeret);
// draw
rect(kacsaX, kacsaY, kacsaMeret, kacsaMeret);
```

**TODO:**
*[szorgalmi]*
Biztos, hogy a lesz aki szeretne a négyzet helyett "igazi" kacsát használni.

### Célkereszt rajzolása

A célkereszt két kör ami az egeret követi. Igény szerint lehet kereszteket is rakni rá, erre van példa a programban.

```java
// Kulso nagy karika
noFill();
stroke(#FF0000, 100);
strokeWeight(2);
ellipse(mouseX, mouseY, celkeresztMeret, celkeresztMeret);

// Celzo pont
noStroke();
fill(#FF0000, 100);
ellipse(mouseX, mouseY, 2, 2);
```

### Elsütőbillenytű

Kattintásra le kell lőni a kacsát. Ehhez kattintáskor meg kell nézni, hogy az egér koordinátái benne vannak-e a négyzet koordinátáiban.
Érdemes megint megjegyezni, hogy a kacsa bal felső sarka a kacsa origója.

```java
if (mousePressed) {
  if (mouseX >= kacsaX && mouseX <= kacsaX + kacsaMeret
   && mouseY >= kacsaY && mouseY <= kacsaY + kacsaMeret) {
     ...
   }
}
```

> Ha valakinek a kacsája esetleg kör lenne, annak most egyszerűbb dolga van, mert csak távolságot kell számolni a kör közepe és az egér koordinátái között a beépített `dist` függvénnyel.

### Támadás pusztítás és feltámasztás

Találatkor ki kell nyírni a kacsát majd érdemes feltámasztani, hogy újra le lehessen lőni. Ez a játék lényege. A pusztítás!

> Itt érdemes a kacsa rajzoló és kacsa feltámasztó kódot függvényekbe szervezni.

> Az egyszerűség kedvéért a halott kacsa nálam azt jeleni, hogy a vásznon kívül rajzolom.

### Játékmechanika

#### Az idő fogalmának bevezetése
A legnagyobb kihívásunk a játékosunk számára az, hogy megtalálja-e az egeret. Hogyan tehetjük nehezebbé, izgalmasabbá? Például eltüntethetjük a kacsát ha a játékos nem tud eléggé gyorsan rákattintani.
Hogyan mérjük az eltelt időt a játékban? Számoljuk a frameket.

Ha 1 másodperc 60 képkockának felel meg és tudjuk melyik frameben raktuk ki a kacsát akkor tudjuk figyelni, hogy eltelt-e már elég idő ahhoz, hogy a kacsát levegyük.

```java
if (frameCount - kacsaSzuletett > kacsaElet * frameRate) {...}
```

**Szorgalmi feladatok:**
 - A kacsa eltűnési ideje legyen random bizonyos keretek között.
 - Próbálják meg a beépített `millis()` függvénnyel megoldani a feladatot.

> Az egy másodperc alatt megjelenített képkockák száma a teljesítmény függvényében változik rajzolásonként `frameRate` konstansban van tárolva.

> Van persze egy beépített függvény `millis()` ami a számítógép órájából olvassa ki az ezredmásodperceket, de ezt legfeljebb magunk ellenőrzésére használjuk.

### Pontozás

Nagyon egyszerű pontozási rendszert fogunk bevezetni. A játékos minden lelőtt kacsa után kap egy pontot. Amit ki is írunk a képernyőre.
Ha a játékos kihagyott egy kacsát veszít az életéből, ami ha elfogy elveszíti a játékot. Ekkor egyszerűen visszaállítjuk a kezdő állapotot és újra kezdjük a játékot.

**Tipikus hibák:**
 - A megjelenő kacsa eltakarja az eredményjelzőt.
 - Nem sikerül minden státusz változó alapértékét visszaállítani.

**Szorgalmi feladatok:**
 - Járjon pontlevonás ha a játékos nem találja el a kacsát. (félrekattint)
 - A státuszváltozókat beállítását szervezzük ki egy függvénybe. (reset)
 - A kacsa eltűnési ideje a lelőtt kacsák számának növekedésével csökkenjen.
 - Minél rövidebb ideig volt kint egy kacsa a képernyőn annál több pontot érjen.

#### Játék állapotának követése

Adjunk a játékunknak egy keretet azzal, hogy nem azonnal indítjuk hanem csak kattintásra.
A játéknak legyen lezárása, ha a játékos elveszíti minden életét, kössük az orrára és csak kattintásra induljon újra a játék.

**Szorgalmi feladatok:**
 - Maximum elért pontszám tárolása a játékok folyamán.
 - Jájék megállítása funkció. (pause)