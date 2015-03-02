float kacsaX, kacsaY, kacsaMeret, kacsaSzuletett, kacsaElet;
int pontszam, eletek;
float celkeresztMeret;

boolean jatekban;

void setup() {
  size(800, 600);

  kacsaElet = 3; // masodperc
  kacsaMeret = 80;
  celkeresztMeret = 32;
  jatekban = false;

  reset();
}

void draw() {
  background(#ffffff);

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
  fill(#BADA55);
  noStroke();
  rect(kacsaX, kacsaY, kacsaMeret, kacsaMeret);
}

void kacsaTeremt() {
  kacsaX = random(20, width - kacsaMeret);
  kacsaY = random(20, height - kacsaMeret);
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
