int pontszam, eletek, kacsakAKepernyon, megoltKacsak;
int maxKacsak = 5;

float[] kacsaX = new float[maxKacsak];
float[] kacsaY = new float[maxKacsak];
float[] kacsaSzuletett = new float[maxKacsak];
float[] kacsaElet = new float[maxKacsak];

float celkeresztMeret, kacsaMeret, talajszint;

PImage talaj, bokor, kacsa;

boolean jatekban;

void setup() {
  size(800, 600);

  talajszint = height - 205;
  talaj = loadImage("talaj.png"); // 800x205
  bokor = loadImage("bokor.png"); // 45x81
  kacsa = loadImage("kacsa.png"); // 35x31

  megoltKacsak = 0; // Nyomon követi, hogy mennyi kacsa halt meg azóta, hogy hozzáadtunk egy újat.
  kacsakAKepernyon = 1;
  kacsaMeret = 35;
  celkeresztMeret = 22;
  jatekban = false; // Innen tudjuk, hogy a játékot kell renderelni, vagy a kezdő/vég képernyőt.

  reset();
}

void draw() {
  background(#64b1ff);

  if (jatekban) {
    // Játékban vagyunk és az életek sem fogytak még el.
    if (eletek > 0) {
      // Megkeresi a túlélő kacsákat és újrateremti őket.
      for (int kacsaSorszam = 0; kacsaSorszam < kacsakAKepernyon; ++kacsaSorszam) {
        if (frameCount - kacsaSzuletett[kacsaSorszam] > kacsaElet[kacsaSorszam] * frameRate) {
          kacsakAKepernyon = 1;
          eletek -= 1;
          megoltKacsak = 0;
          kacsaTeremt(kacsaSorszam);
        }
      }

      // Minden valahány megölt kacsa után egyel többet teremtünk. (5, 15, 30, 50, 75 )
      if (megoltKacsak > 0 && megoltKacsak % (5 * kacsakAKepernyon) == 0 && kacsakAKepernyon < maxKacsak) {
        megoltKacsak = 0;
        kacsakAKepernyon += 1;
        kacsaTeremt(kacsakAKepernyon - 1);
      }

      kacsaRajzol();
    } else {
      // Elfogytak az életek, megállítjuk a játékot
      jatekban = false;
    }
  } else {
    // Meg van állítva a játék, kiderítjuk miért
    if (eletek == 0) {
      vegeredmeny();
    } else {
      kezdokepernyo();
    }

    // Kattintásra újraindul a játék
    if (mousePressed) {
      jatekban = true;
      reset();
      kacsaTeremt(0);
    }
  }

  // Az eredményjelzőt és a célkeresztet rajzoljuk minden fölé.
  talajRajzol();
  eredmenyjelzo();
  celkeresztRajzol();
}

void mousePressed() {
  // Megkeresi a kacsát amit eltalált a játékos és újrateremti.
  for (int kacsaSorszam = 0; kacsaSorszam < kacsakAKepernyon; ++kacsaSorszam) {
    if (talalat(kacsaX[kacsaSorszam], kacsaY[kacsaSorszam])) {
      megoltKacsak += 1;
      pontszam += 1;
      kacsaTeremt(kacsaSorszam);
    }
  }
}

boolean talalat(float x, float y) {
  return mouseX >= x && mouseX <= x + kacsaMeret
      && mouseY >= y && mouseY <= y + kacsaMeret;
}

void reset() {
  eletek = 3;
  pontszam = 0;
}

void kacsaRajzol() {
  for (int kacsaSorszam = 0; kacsaSorszam < kacsakAKepernyon; ++kacsaSorszam) {
    image(kacsa, kacsaX[kacsaSorszam], kacsaY[kacsaSorszam]);
  }
}

void kacsaTeremt(int kacsaSorszam) {
  // Nem teremthetjük a kacsát a talajszint alá
  kacsaX[kacsaSorszam] = random(20, width - kacsaMeret);
  kacsaY[kacsaSorszam] = random(20, talajszint - kacsaMeret);
  kacsaSzuletett[kacsaSorszam] = frameCount;
  kacsaElet[kacsaSorszam] = random(2, 3);
}

/**********************
 * Rajzoló függvények *
 **********************/

void kezdokepernyo() {
  fill(0);
  textSize(26);
  String szoveg = "A játék kattintással indul.";
  float tw = textWidth(szoveg);
  text(szoveg, width / 2 - tw / 2, height / 2 - 13 * 1.4);
}

void vegeredmeny() {
  String szoveg;
  float szovegSzelesseg, szovegMagassag;
  fill(0);

  textSize(26);
  szoveg = "Gratulálok! Vesztettél!";
  szovegSzelesseg = textWidth(szoveg);
  szovegMagassag = 26 * 1.4;
  text(szoveg, width / 2 - szovegSzelesseg / 2, height / 2 - szovegMagassag);

  textSize(14);
  szoveg = "A játék kattintással újraindul!";
  szovegSzelesseg = textWidth(szoveg);
  szovegMagassag += 7 * 1.4;
  text(szoveg, width / 2 - szovegSzelesseg / 2, height / 2);
}

void eredmenyjelzo() {
  textSize(12);

  // Eredmeny csik
  fill(0);
  rect(0, 0, width, 20);

  // Eredmeny jelzo
  fill(255);
  text("Pontszám: " + pontszam, 80, 16);
  text("Életek: " + eletek, 180, 16);
}

void celkeresztRajzol() {
  // Külső nagy karika
  noFill();
  stroke(#FF0000, 100);
  strokeWeight(2);
  ellipse(mouseX, mouseY, celkeresztMeret, celkeresztMeret);

  // Célzó pont
  noStroke();
  fill(#FF0000, 100);
  ellipse(mouseX, mouseY, 2, 2);

  // Keresztek (Szorgalmi)
  noStroke();
  fill(#FF0000, 100);
  float r = celkeresztMeret / 2;
  rect(mouseX - r - 3, mouseY, 10, 2); // bal
  rect(mouseX, mouseY - r - 3, 2, 10); // fent
  rect(mouseX + r - 6, mouseY, 10, 2); // jobb
  rect(mouseX, mouseY + r - 6, 2, 10); // lent
}

void talajRajzol() {
  image(talaj, 0, talajszint);
  image(bokor, 100, talajszint - 30);
  image(bokor, 270, talajszint - 30);
  image(bokor, 700, talajszint - 30);
}