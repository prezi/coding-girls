float kacsaX, kacsaY, kacsaMeret, kacsaSzuletett, kacsaElet;
int pontszam, eletek;
float celkeresztMeret, talajszint;

PImage talaj, bokor, kacsa;

boolean jatekban;

void setup() {
  size(800, 600);

  talajszint = height - 205;
  talaj = loadImage("talaj.png"); // 800x205
  bokor = loadImage("bokor.png"); // 45x81
  kacsa = loadImage("kacsa.png"); // 35x31

  kacsaElet = 3; // másodperc
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
      kacsaRajzol();

      // Lusta volt a vadász, túlélte a kacsa.
      if (frameCount - kacsaSzuletett > kacsaElet * frameRate) {
        eletek -= 1;
        kacsaTeremt();
      }

      // Teli találat, a kacsa halott.
      if (mousePressed && talalat()) {
        pontszam += 1;
        kacsaTeremt();
      }
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
      kacsaTeremt();
    }
  }

  // Az eredményjelzőt és a célkeresztet rajzoljuk minden fölé.
  talajRajzol();
  eredmenyjelzo();
  celkeresztRajzol();
}

boolean talalat() {
  return mouseX >= kacsaX && mouseX <= kacsaX + kacsaMeret
      && mouseY >= kacsaY && mouseY <= kacsaY + kacsaMeret;
}

void reset() {
  eletek = 3;
  pontszam = 0;
}

void kacsaRajzol() {
  image(kacsa, kacsaX, kacsaY);
}

void kacsaTeremt() {
  // Nem teremthetjük a kacsát a talajszint alá
  kacsaX = random(20, width - kacsaMeret);
  kacsaY = random(20, talajszint - kacsaMeret);
  kacsaSzuletett = frameCount;
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