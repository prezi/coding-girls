
# Week 4

## Függvények, szubrutinok

Nem zavart eddig senkit sem, hogy minden egyes alkalommal amikor egy kort akartunk kirajzolni, akkor ezt kellett beírnunk:

```Java
float sugar = 60;
ellipse(width / 2, height / 2, sugar, sugar);
```

Kérdés: Nincsen a Processingben valami egyszerű  `kor` vagy esetleg `circle` parancs, ami ezt megoldaná nekünk?

A válasz az, hogy nincsen, de szerencsére tudunk csinálni!

Függvényeket nem nehéz készíteni. Először is ki kell találnunk mit szeretne csinálni a függvényünk. Eztán meghatározzuk, hogy milyen adatokra lesz szüksége, hogy az adott műveleteket elvégezze. Hasonlóan a matematikában tanult függvényekhez, a Processingben is tudunk kimeneteket adni.

A függvényeket csak a létrehozásuk után tudjuk használni. Itt egy egyszerű példa arra, hogy hogyan lehet egy számtani és egy mértani közepet meghatározni Processingben:

```Java
void setup() {
    println(szamtaniKozep(10, 12));
    println(mertaniKozep(10, 12));
}

float szamtaniKozep(float a, float b) {
    return (a + b) / 2;
}

float mertaniKozep(float a, float b) {
    return sqrt(a * b);
}
```

Ha jól megnézzük a kódot, láthatjuk, hogy nem 2, de 3 függvénydefiníció van a programunkban. A setup-ot nem kell meghívnunk, nem kell használnunk a kódban, hogy érvénybe lépjen, a Processing ezt elintézi nekünk. Ezek alapján a Processingben egy függvény definiálásának a szignatúrája így néz ki:

`<visszatérési típus> <függvény neve>(bemeneti változók) {...}`

Az eddig tanultak alapján tudhatjuk, hogy a változókat amiket létrehozunk bemenetként csak a függvénydefinícióban használhatjuk.

A void függvények olyan függvények, amiknek nincsen visszatérési értékük.

```Java
void setup() {
    size(400, 400);
    background(#FFFFFF);
}

void draw() {
    kor(mouseX, mouseY, 60);
}

void kor(float kozepX, float kozepY, float sugar) {
    ellipse(kozepX, kozepY, sugar, sugar);
}
```

## Cikusok

Kellemetlen órai idézet is lehet:

> Feladat: a setupban rajzoljatok ki 2000 kört random helyeken a vásznon.

Miután hosszú sóhajt ejtetek, nekiálltok a copypastenek, én meg gonoszan nevetve majszolom a pizzát.

Annak érdekében, hogy ilyen szituáció soha ne forduljon elő, mutatok egy pár trükköt, amivel kijátszhatjátok az ilyen jellegű feladatokat.

### While

Avagy amíg. A while kulcsszónak meg kell adnunk egy logikai paramétert, illetve 

```Java
void setup() {
  size(800, 600);
}

void draw() {
  while(random(10) < 1) {
    ellipse(mouseX, mouseY, 10, 10);
  }
}
```

> Az alabbi pelda nem mukodik tokeletesen. TODO: Review

```Java
boolean paused = false;

void setup() {
  size(800, 600);
}

void draw() {
  if(keyPressed) {
    if(key == 'p') {
      paused = !paused;
    }
  }
  
  if(!paused) {
    ellipse(random(width), random(height), 30, 30);
  }
}
```

### For


