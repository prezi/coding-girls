float kacsaX, kacsaY, kacsaMeret, kacsaSzuletett, kacsaElet;
float celkeresztMeret;

void setup() {
  size(800, 600);

  kacsaElet = 3; // masodperc
  kacsaMeret = 80;
  celkeresztMeret = 32;

  kacsaTeremt();
}

void draw() {
  background(#ffffff);

  kacsaRajzol();
  celkeresztRajzol();

  if (frameCount - kacsaSzuletett > kacsaElet * frameRate) {
    kacsaMegol();
    kacsaTeremt();
  }

  if (mousePressed && talalat()) {
     kacsaMegol();
     kacsaTeremt();
  }
}

boolean talalat() {
  return mouseX >= kacsaX && mouseX <= kacsaX + kacsaMeret
      && mouseY >= kacsaY && mouseY <= kacsaY + kacsaMeret;
}

void kacsaRajzol() {
  fill(#BADA55);
  noStroke();
  rect(kacsaX, kacsaY, kacsaMeret, kacsaMeret);
}

void kacsaTeremt() {
  kacsaX = random(0, width - kacsaMeret);
  kacsaY = random(0, height - kacsaMeret);
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
