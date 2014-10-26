
# Week 4

## Függvények, szubrutinok

Nem zavart eddig senkit sem, hogy minden egyes alkalommal amikor egy kört akartunk kirajzolni, akkor ezt kellett beírnunk:

```Java
float sugar = 60;
ellipse(width / 2, height / 2, sugar, sugar);
```

Kérdés: Nincsen a Processingben valami egyszerű  `kor` vagy esetleg `circle` parancs, ami ezt megoldaná nekünk?

A válasz az, hogy nincsen, de szerencsére tudunk csinálni!

Függvényeket nem nehéz készíteni. Először is ki kell találnunk mit szeretne csinálni a függvényünk. Ezután meghatározzuk, hogy milyen adatokra lesz szüksége, hogy az adott műveleteket elvégezze. Hasonlóan a matematikában tanult függvényekhez, a Processingben is tudunk kimeneteket adni.

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

Ha jól megnézzük a kódot, láthatjuk, hogy nem 2, de 3 függvénydefiníció van a programunkban. A setup-ot nem kell meghívnunk, nem kell használnunk a kódban, hogy érvénybe lépjen. A Processing ezt elintézi nekünk. Ezek alapján a Processingben egy függvény definiálásának a szignatúrája így néz ki:

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

Beépitett függveny felüldefiniálása:

```Java
boolean paused = false;

void setup() {
  size(800, 600);
}

void draw() {
  if(!paused) {
    ellipse(random(width), random(height), 30, 30);
  }
}

void keyPressed() {
  if(key == 'p') {
    paused = !paused;
  }
}
```

## Ciklusok

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

```Java
void setup() {
  size(800, 600);
  
  int counter = 0;
  int korSzam = 0;
  while(counter < 100) {
    counter += random(10);
    
    float korX = random(width);
    float korY = random(height);  
    
    ellipse(korX, korY, 40, 40);
    korSzam += 1;
  }
  
  println(korSzam);
}
```


### For

```Java
float negyzetOldal;
int negyzetekSzamaX;

void setup() {
  size(800, 600);
  noStroke();
  
  negyzetOldal = 100;
  negyzetekSzamaX = (int) (width / negyzetOldal); 
}

void draw() {
  if(mousePressed) {
    for(int i = 0; i < negyzetekSzamaX; ++i) {
      fill(random(255), random(255), random(255));
      rect(i * negyzetOldal, 0, negyzetOldal, height);
    }
  }
}
```

Túl sok a zárójel! Olvashatatlan! Ki írta ezt? Emeljük ki függvénybe!

```Java
float negyzetOldal;
int negyzetekSzamaX;

void setup() {
  size(800, 600);
  noStroke();
  
  negyzetOldal = 100;
  negyzetekSzamaX = (int) (width / negyzetOldal); 
}

void draw() {
  if(mousePressed) {
    rajzoljTeglalapokat();
  }
}

void rajzoljTeglalapokat() {
  for(int i = 0; i < negyzetekSzamaX; ++i) {
    fill(random(255), random(255), random(255));
    rect(i * negyzetOldal, 0, negyzetOldal, height);
  }
}
```
