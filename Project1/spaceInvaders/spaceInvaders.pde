// Space

int UFOK_SZAMA = 5;
float ufoPozicioX[] = new float[UFOK_SZAMA];
float ufoPozicioY[] = new float[UFOK_SZAMA];
float ufoSzelesseg = 30;
float ufoMagassag = 20;
float ufoEltolasOldalra;
float UFO_SEBESSEG = 5;
boolean ufoMozogLe = false;
color ufoSzin;

float balMargo;
float jobbMargo;

float fegyverPozicioX;
color fegyverSzin;
color lezerSzin;

void setup() {
  size(1024, 600);

  for (int i = 0; i < ufoPozicioX.length; i++) {
    ufoPozicioX[i] = width / 2 - (ufoPozicioX.length/2 * (ufoSzelesseg * 2.5)) + (ufoSzelesseg * 2.5 * i);  
    ufoPozicioY[i] = 100;
  }

  ufoEltolasOldalra = -UFO_SEBESSEG;
  ufoMozogLe = false;
  ufoSzin = color(#F0DE11);

  balMargo = width / 10;
  jobbMargo = width - width / 10;

  fegyverPozicioX = (width + 40)/2;
  fegyverSzin = #777777;
  lezerSzin = #AA0000;
}

void draw() {
  background(#000000);

  ufoMozgatOldalra();
  ufoMozgatLefele();

  ufoRajzol();
  fegyverRajzol();
}

void fegyverRajzol() {
  stroke(fegyverSzin);
  fill(fegyverSzin);
  arc(fegyverPozicioX, height - 30, 40, 40, PI, TWO_PI);
  rect(fegyverPozicioX - 1.5, height - 60, 3, 10);
}

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
    if (ufoPozicioX[i] > 0) {
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
}

void ufoMozgatLefele() {
  if (ufoMozogLe) {
    ufoMozogLe = false;
    for (int i = 0; i < ufoPozicioY.length; i++) {
      if (ufoPozicioY[i] > 0) {
        ufoPozicioY[i] += ufoMagassag;
      }
    }
  }
}

void keyPressed() {
  if (keyCode == 'A') {
    fegyverPozicioX += -13;
  } else
    if (keyCode == 'D') {
    fegyverPozicioX += +13;
  } else
    if (keyCode == ' ') {
    lezerLoves();
    lovestEllenoriz();
  } else
    if (keyCode == 'R') {
    setup();
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

void mouseMoved() {
  fegyverPozicioX = mouseX;
}
