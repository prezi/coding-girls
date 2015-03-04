
# Processing Workshop

## Bevezetes

### Peldak

 - Topics/Drawing/Pattern
 - Topics/Drawing/Pulses
 - Topics/Motion/Bouce
 - Topics/UI/Button
 - Gorilla

### Processing alapok

Koordinata rendszer hogy nez ki. Alap alakzatok rajzolasa. Szinezes elejen megmutatni a color pickert.

```Java
size(800, 600);

fill(#FF00FF);
stroke(#00FF00);
ellipse(width/2, height/2, 100, 100);

noFill();
stroke(#000000);
rect(width/2, height/2, 100, 100);
```

Beszelhetunk a `draw`-rol ha van idonk. 

```Java
void setup () {
    size(800, 600);
}

void draw () {
    fill(#FF00FF);
    stroke(#00FF00);
    ellipse(mouseX, mouseY, 100, 100); 
}
```

Backgroundrol beszelni.

### A feladat

Fruit Ninja

#### Elso lepes

Kor kirajzolasa es hatter beallitasa.

#### Masodik lepes

Labda leesik egyenletes sebesseggel. Valtozok bevezetese.

#### Harmadik Lepes

Random helyrol essen le a labda.

#### Negyedik lepes

Gyorsuljon. Kis beszed a fizikarol. Mi a sebesseg, mi a gyorsulas.

#### Otodik lepes

Ugorjon vissza. Beszed az elgazasokrol. 

#### Hatodik lepes

Random helyen ugorjon vissza.

#### Hetedik lepes

Ha benne van az eger a korben akkor valtozzon meg a szine. Mentorok nezzek meg, hogy tutira ne a `setup`-ba menjen a kod amit itt irunk. 

```Java
...
if (dist(mouseX, mouseY, x, y) < d/2) {
    fill(#FF0000);
} else {
    fill(#FFFFFF);
}
...
```

#### Nyolcadik
Kimozgatni a fenti ifet kis modositasokkal a `mousePressed`-be. Gyakorlatilag, random helyre visszarakjuk alulra, lasd `setup`.

#### Final

```Java
float x, y, vy, d;
color bg = #B23232;

float G = 0.3;

void setup () {
  size(800, 600);
  
  d = random(50, 100);
  x = random(d, width-d);
  vy = -20;
  y = height + 200;
}

void draw () {
  background(bg);
  ellipse(x, y, d, d);
  y += vy;
  vy += G;
  
  if (y > height + 200) {
    d = random(50, 70);
    x = random(d, width-d);
    vy = -20;
  }
}

void mousePressed () {
  if (dist(mouseX, mouseY, x, y) < d/2) {
    y = height + 200;
    d = random(50, 70);
    x = random(d, width-d);
    vy = -20;
  }
}
```

#### Extrak

 - Pontozas
 - x-beni mozgas
 - Kepek
 - Feltoltes OpenProcessingre
