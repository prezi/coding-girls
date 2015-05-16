
# Space Invaders

## Bevezetés

Az alábbi játékot 2 hét alatt készítjük el. A lényege, hogy egy lézerfegyverrel kell lelőni a folyamatosan mozgó ufókat.
Az alábbi lépésekből áll a játék elkészítése:

 1. Fegyver rajzolása
 2. Fegyver mozgatása
 3. Ufók rajzolása
 4. Ufók mozgatása
 5. Lövés és találat ellenőrzése

## A fegyver

A fegyver rajzolása elég primitív: egy fél körcikk és egy téglalap ami a fegyver csöve.
A fél körcikk helyett lehet téglalapot is használni, vagy lehet kreatívkodni is.

> Körcikk: A rajzoláshoz kell ismerni és tudni a radiánt, ugyanis az `arc` radiánban várja és nem fokban, hogy mettől meddig rajzolja a fél körcikket. Érdemes a paraméterekkel kisérletezni, hogy lássuk, hogyan működik az `arc` függvény.

Ezután a fegyver könnyen megrajzolható. Érdemes már most az elején függvényekbe szervezni a programunkat, hogy átlátható és könnyen módosítható legyen.

```Java
float fegyverPozicioX;
color fegyverSzin;

void setup() {
  size(800, 600);
  
  fegyverPozicioX = (width + 40)/2;
  fegyverSzin = #777777;
}

void draw() {
  background(#000000);
  fegyverRajzol();
}

void fegyverRajzol() {
  stroke(fegyverSzin);
  fill(fegyverSzin);
  arc(fegyverPozicioX, height - 30, 40, 40, PI, TWO_PI);
  rect(fegyverPozicioX - 1.5, height - 60, 3, 10);
}
```

Ezután jöhet a fegyver mozgatása. Ehhez a `keyPressed` beépített Processing függvényt használjuk.

```Java
void keyPressed() {
  if (keyCode == 'A') {
  	// balra mozgatjuk a fegyvert
    ...
  } else
  if (keyCode == 'D') {
  	// jobbra mozgatjuk a fegyvert
  	...
  }
}
```

Persze lehet már billentyűket is használni.

Bónusz feladat és/vagy házi
	Fegyver mozgatása egér mozgatásra.

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
  if (keyCode == 'A') {
    fegyverPozicioX += -13;
  } else
    if (keyCode == 'D') {
    fegyverPozicioX += +13;
  } 
}

```

Bónusz feladat és/vagy házi
	Rajzolás kiemelése
	A fegyver ne tudjon kimenni a képernyőről

## Ufók

A játék során egyszerre több ufó ellen szeretnénk harcolni, azonban egyelőre érdemes egy ufóval kezdeni a rajzolást, mozgatást, majd később átírni többre.
Több ufó rajzolás esetén majd ki kell számolni, hogy az ufók egyelő távolságra legyenek egymástól. Persze, ha valaki kreatívoskodni akar, akkor el lehet ettől térni.
Jó ötlet lehet a képernyőn véletlen szerűen elhelyezni az ufókat és úgy mozgatni. Ilyenkor majd arra kell figyelni, hogy mindegyik ufó máskor lesz majd a képernyő szélén, így azokat mozgás közben külön-külön kell majd figyelni.

```Java
...
int UFOK_SZAMA = 5;
float ufoPozicioX[] = new float[UFOK_SZAMA];
float ufoPozicioY[] = new float[UFOK_SZAMA];
float ufoSzelesseg = 30;
float ufoMagassag = 20;
float ufoEltolasOldalra;
float UFO_SEBESSEG = 5;
color ufoSzin;

void setup() {
  ...
  for (int i = 0; i < ufoPozicioX.length; i++) {
    ufoPozicioX[i] = width / 2 - (ufoPozicioX.length/2 * (ufoSzelesseg * 2.5)) + (ufoSzelesseg * 2.5 * i);  
    ufoPozicioY[i] = 100;
  }

  ufoEltolasOldalra = -UFO_SEBESSEG;
  ufoMozogLe = false;
  ufoSzin = color(#F0DE11);
}

void draw() {
  ...
  ufoRajzol();
  ufoMozgatOldalra();
}

...

void ufoRajzol() {
  stroke(ufoSzin);
  fill(ufoSzin);
  for (int i = 0; i < ufoPozicioX.length; i++) {
    if (ufoPozicioX[i] > 0)
      ellipse(ufoPozicioX[i], ufoPozicioY[i], ufoSzelesseg, ufoMagassag);
  }
}

void ufoMozgatOldalra() {
  for (int i = 0; i < ufoPozicioX.length; i++) {
      ufoPozicioX[i] += ufoEltolasOldalra;
      if (balMargo >= ufoPozicioX[i]) {
        ufoEltolasOldalra = UFO_SEBESSEG;
        ufoMozogLe = true;
      } else
        if (jobbMargo <= ufoPozicioX[i]) {
        ufoEltolasOldalra = -UFO_SEBESSEG;
        ufoMozogLe = true;
      }
  }
}
```

Bónusz feladat és/vagy házi
	Ne engedjük az ufókat teljesen a képernyő széléig, legyen egy margó
	Ha a képernyő szélére kerülnek az ufók, akkor menjenek egy sorral lejjebb és utána menjenek a másik képernyő széle felé
	
## Lézerlövés és találat

Már csak a lézer rajzolása és a találat ellenőrzése van hátra.
A lézer megrajzolásánál arra kell figyelni, hogy a fegyver közepétől (a fegyver csövétől) rajzoljuk a lézert (piros csíkot) egészen a képernyő tetejéig. Ezt akkor rajzoljuk, ha lenyomtunk egy gombot, mondjuk a space-t.
A másik feladat a találat ellenőrzése. Azt kell nézni, hogy a lézersugár az ufó bal szélénél nagyobb, de a jobbnál kisebb. 
Annyi, ha találat érte az ufót, akkor azt az ufót többet már nem rajzoljuk ki, valahogy meg kellene jelölni, hogy ő már nem játszik. Én ezt úgy oldottam meg, hogy a pozícióját -1-re állítottam és bármikor az ufókkal kapcsolatban csináltam valamit (pl kirajzoltam), akkor vizsgáltam, hogy a pozíciója nagyobb e nullánál.

> Szükség esetén érdemes átismételni a logikai feltételeket.

```Java
void keyPressed() {
...
    if (keyCode == ' ') {
       lezerLoves();
       lovestEllenoriz();
  	}
}

void ufoRajzol() {
...
    if (ufoPozicioX[i] > 0)
      ellipse(ufoPozicioX[i], ufoPozicioY[i], ufoSzelesseg, ufoMagassag);
...
}

void ufoMozgatOldalra() {
  for (int i = 0; i < ufoPozicioX.length; i++) {
    if (ufoPozicioX[i] > 0) {
      ufoPozicioX[i] += ufoEltolasOldalra;
	  ...
	}
  }
}

void lezerLoves() {
  stroke(lezerSzin);
  fill(lezerSzin);
  rect(fegyverPozicioX - 1.5, 0, 3, height - 60);
}

void lovestEllenoriz() {
  for (int i = 0; i < ufoPozicioX.length; i++) {
    if (ufoPozicioX[i] > 0) {
      if (ufoPozicioX[i] - ufoSzelesseg / 2 < fegyverPozicioX && fegyverPozicioX < ufoPozicioX[i] + ufoSzelesseg / 2)
        ufoPozicioX[i] = -1;
      }
  }
}
```

## Extrák

Ha minden jól ment, akkor a lényegi, kötelező részével készen is vagyunk, most már csak játszani kell és csinosítgatni. :-)

Az alábbiakat lehet hozzátenni még:
	Legyen vége a játéknak, ha kilőttünk minden ufót (győzelem)
	Legyen vége a játéknak, ha az ufók olyan alacsonyra süllyednek mint a fegyver (game over)
	Pontozni is lehet mennyi ufót löttünk ki
	Random mindig új ufót lehet betenni a képernyő tetejére, ha kilövünk egyet
	Képeket lehet használni
	Openprocessingre kitétel

