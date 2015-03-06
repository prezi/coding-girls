# Kacsavadászat

![Képkivágás a játékból](https://www.dropbox.com/s/6eznowx4c8kne5k/Screenshot%202015-03-06%2012.29.24.png?raw=1)

## A játék menete

A képernyőn megjelenő kacsákat kell kattintással likvidálni. Miután megöltünk egy kacsát egy újabb fog megjelenni a képernyőn. A játékot nem lehet megnyerni, a célja minél több kacsa megölése és ezáltal minél több pont gyüjtése.

A jó a játékban, hogy a fejlesztő a kacsát bármilyen képpel helyettesítheti. Cicával, kutyával, biosz tanárral.

## Fejlesztési lépések

A játék fejlesztésének lépéseit mutatom be minden lépésben elvégezhető szorgalmi feladatokkal, amik érdekesebbé teszik a fejlesztést és a kész játékot is.

> A fejlesztési lépések csak az alapjátékot mutatják be, a szorgalmi feladatok közül csak néhány része az én példámnak.

* [●●●●●] Nehézséget jelöli. Minél több a ● annál nehezebb a feladat.

### Négyzet a képernyőn [●]

Készítünk egy négyzetet ami véletlenszerűen megjelenik a vásznon. Ez lesz a kacsánk hitboxa.

```java
// Setup
kacsaX = random(0, width - kacsaMeret);
kacsaY = random(0, height - kacsaMeret);
// draw
rect(kacsaX, kacsaY, kacsaMeret, kacsaMeret);
```

**Tipikus hibák**
 - A négyzet kilóg a képernyőről, mert a kacsa méretei nincsenek kivonva a vászon méretból a `random` függvényben.
 - A kacsa átmegy idegbetegbe, mert a random generálás a drawba kerül.

> A processing alapértelmezésként az alakzat bal felső sarkát számolja origónak (`rectMode()`), a körnek a kozepét(`ellispeMode()`).

**Szorgalmi feladatok:**
- Négyzet helyett kép vagy más alakzat használata. [●]
- Egyszerű környezet rajzolása. (talaj, ég, fácska, napocska) [●●]
- Több kacsa megjelenítése a képernyőn (tömbökkel). [●●●]
- A kacsa alulról repüljön be a képernyőre. [●●●]

### Célkereszt [●]

A célkereszt bármilyen alakzat lehet ami az egeret követi. A példában két koncentrikus kört választottam.

```java
// Kulső nagy karika
noFill();
stroke(#FF0000, 100);
strokeWeight(2);
ellipse(mouseX, mouseY, celkeresztMeret, celkeresztMeret);

// Celzó pont
noStroke();
fill(#FF0000, 100);
ellipse(mouseX, mouseY, 2, 2);
```

**Szorgalmi feladatok:**
 - A célkerszt cicomázása. [●]

> Rengeteg féle képpen lehet cicomázni a célkeresztet, ezek többsége nem nehéz csak sokáig tart. Ne ezzel menjen el az idő!

### Elsütőbillenytű [●●●]

A játék célja lelőni a kacsát, ezt a már jól ismert "húzd és kattints" módszerrel csináljuk. Ehhez kattintáskor meg kell nézni, hogy az egér koordinátái benne vannak-e a négyzet koordinátáiban.
Érdemes megint megjegyezni, hogy a kacsa bal felső sarka a kacsa origója.

```java
if (mousePressed) {
  if (mouseX >= kacsaX && mouseX <= kacsaX + kacsaMeret
   && mouseY >= kacsaY && mouseY <= kacsaY + kacsaMeret) {
     ...
   }
}
```

> Ha valakinek a kacsája közelebb áll a körhöz, mint a négyzethez, annak most egyszerűbb dolga van, mert csak távolságot kell számolni a kör közepe és az egér koordinátái között a beépített `dist` függvénnyel és megnézni, a távolság nagyobb-e a sugárnál.

### Támadás pusztítás és feltámasztás [●]

Sikeres találatkor a kacsa meghal, le kell venni a képernyőről, majd egy újat kell a helyébe tenni.

**Szorgalmi feladatok:**
 - Érdemes a kacsa rajzoló és kacsa feltámasztó kódot függvényekbe szervezni. [●]
 - A halott kacsa essen ki a képernyőről. [●●●●]

> Mit jelent a halott kacsa? Tényleg szükséges megölni, vagy elég csak egy másik helyre rajzolni?

### Játékmechanika

#### Az idő fogalmának bevezetése [●●●]

A legnagyobb kihívásunk a játékosunk számára az, hogy megtalálja-e az egeret. Hogyan tehetjük nehezebbé, izgalmasabbá a vadászatot? Például eltüntethetjük a kacsát ha a játékos nem tud eléggé gyorsan rákattintani.
Hogyan mérjük az eltelt időt a játékban? [●●●]

Ha 1 másodperc 60 képkockának felel meg és tudjuk melyik frameben raktuk ki a kacsát akkor tudjuk figyelni - a framek számolásával - hogy eltelt-e már elég idő ahhoz, hogy a kacsát levegyük.

```java
if (frameCount - kacsaSzuletett > kacsaElet * frameRate) {...}
```

**Szorgalmi feladatok:**
 - A kacsa eltűnési ideje legyen random. [●●]
 - Próbálják meg a beépített `millis()` függvénnyel megoldani a feladatot. [●●]

> Az egy másodperc alatt megjelenített képkockák száma a teljesítmény függvényében változik. A `frameRate` konstansban van tárolva az átlag.

### Pontozás [●●]

Nagyon egyszerű pontozási rendszert fogunk bevezetni. A játékos minden lelőtt kacsa után kap egy pontot. Amit ki is írunk a képernyőre.
Ha a játékos kihagyott egy kacsát veszít az életéből, ami ha elfogy elveszíti a játékot. Ekkor egyszerűen visszaállítjuk a kezdő állapotot és újra kezdjük a játékot.

**Szorgalmi feladatok:**
 - A státuszváltozókat beállítását szervezzük ki egy függvénybe. [●]
 - Járjon pontlevonás ha a játékos kattint, de nem találja el a kacsát. [●●]
 - A kacsa eltűnési ideje a lelőtt kacsák számának növekedésével csökkenjen. [●●●]
 - Minél rövidebb ideig volt kint egy kacsa a képernyőn annál több pontot érjen. [●●●]

**Tipikus hibák:**
 - A megjelenő kacsa eltakarja az eredményjelzőt.
 - Nem sikerül minden státusz változó alapértékét visszaállítani.

#### Játék állapotának követése [●●]

Adjunk a játékunknak egy keretet azzal, hogy nem azonnal indítjuk hanem csak kattintásra.
A játéknak legyen lezárása, ha a játékos elveszíti minden életét, kössük az orrára és csak kattintásra induljon újra a játék.

**Szorgalmi feladatok:**
 - Maximum elért pontszám tárolása a játékok folyamán. [●]
 - Jájék megállítása funkció. (pause) [●]


## Néhány szorgalmi feladat kifejtése

### Kacsák és egyszerű környezet rajzolása.

Vigyázni kell, hogy a kacsát mindig a talajszint fölé rajzoljuk. Ha pakolunk bokrokat és fákat is, akkor simán előfordulhat, hogy a kacsa elbújik mögöttük. Ennek a projektnek a keretein belül ezzel nem érdemes foglalkozni. Úgy ahogy az alpha csatornákkal sem. Példa a képek bevezetésére: 06c01ac939c37c22611cea36ec69eeb6e02f052e
A képeket egy androidos játékból vettem kölcsön [innen letölthetőek](https://dl.dropboxusercontent.com/u/63202557/skool/duckhunt-assets.zip).

### Több kacsa megjelenítése a képernyőn.

Egy kacsához 4 állapot tartozik. Az x és y koordinátája (`kacsaX`, `kacsaY`), a születési ideje (`kacsaSzuletett`) és életének a hossza (`kacsaElet`). Ezek négyen pontosan leírják a kacsát.
Ahhoz, hogy több kacsa megjelenhessen a képernyőn ezekből kell többet csinálni. - A játékunk már elég nehéz 2 kacsával is így a tömbök használata akár opcionális is lehet ebben a szorgalmiban.
A naív megközelítése a problémának, az, hogy a fenti változók minden előfordulásához berakunk egy ciklust. Lásd: 186c843efe5077d1f575dbe256d0c1a3f7e92e1f