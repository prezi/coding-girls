float kacsaX, kacsaY, kacsaMeret, kacsaSzuletett, kacsaElet;
int pontszam, eletek;
float celkeresztMeret;

void setup() {
  size(800, 600);

  kacsaElet = 3; // masodperc
  kacsaMeret = 80;
  celkeresztMeret = 32;

  reset();
  kacsaTeremt();
}

void draw() {
  background(#ffffff);

  eredmenyjelzo();

  if (eletek > 0) {
    kacsaRajzol();

    // Lusta volt a vadász, túlélte a kacsa.
    if (frameCount - kacsaSzuletett > kacsaElet * frameRate) {
      eletek -= 1;
      kacsaMegol();
      kacsaTeremt();
    }

    // Teli találat, a kacsa halott.
    if (mousePressed && talalat()) {
      pontszam += 1;
      kacsaMegol();
      kacsaTeremt();
    }
  } else {
    reset();
  }

  celkeresztRajzol();
}

void eredmenyjelzo() {
  // Eredmeny csik
  fill(0, 0, 0, 200);
  rect(0, 0, width, 20);

  // Eredmeny jelzo
  fill(255, 255, 255);
  text("Pontszám: " + pontszam, 80, 16);
  text("Életek: " + eletek, 180, 16);
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

void kacsaMegol() {
  kacsaX = width + kacsaMeret;
  kacsaY = height + kacsaMeret;
}

void celkeresztRajzol() {
  // Kulso nagy karika
  noFill();
  stroke(#FF0000, 100);
  strokeWeight(2);
  ellipse(mouseX, mouseY, celkeresztMeret, celkeresztMeret);

  // Celzo pont
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
