// Space

int UFOK_SZAMA = 5;
float ufoPozicioX[] = new float[UFOK_SZAMA];
float ufoPozicioY[] = new float[UFOK_SZAMA];
float ufoSzelesseg = 30;
float ufoMagassag = 20;
float ufoEltolasOldalra;
float UFO_SEBESSEG = 5;
boolean ufoMozogLe = false;

float balMargo;
float jobbMargo;

float fegyverPozicioX;

float mousePrevX;

void setup() {
  size(1024, 600);

  for (int idx = 0; idx < ufoPozicioX.length; ++idx) {
    ufoPozicioX[idx] = width / 2 - (ufoPozicioX.length/2 * (ufoSzelesseg * 2.5)) + (ufoSzelesseg * 2.5 * idx);  
    ufoPozicioY[idx] = 100;
  }

  ufoEltolasOldalra = -UFO_SEBESSEG;
  ufoMozogLe = false;

  balMargo = width / 10;
  jobbMargo = width - width / 10;

  fegyverPozicioX = (width + 40)/2;
  mousePrevX = 0;
}

void fegyverRajzol() {
  stroke(#777777);
  fill(#777777);
  arc(fegyverPozicioX, height - 30, 40, 40, PI, TWO_PI);
  rect(fegyverPozicioX - 1.5, height - 60, 3, 10);
}

void LezerLoves() {
  stroke(#990000);
  fill(#990000);
  rect(fegyverPozicioX - 1.5, 0, 3, height - 60);
}

void ufoRajzol() {
  stroke(#F0DE11);
  fill(#F0DE11);
  for (int idx = 0; idx < ufoPozicioX.length; ++idx) {
    if (0 < ufoPozicioX[idx])
      ellipse(ufoPozicioX[idx], ufoPozicioY[idx], ufoSzelesseg, ufoMagassag);
  }
}

void ufoMozgatOldalra() {
  for (int idx = 0; idx < ufoPozicioX.length; ++idx) {
    if (0 > ufoPozicioX[idx])
      continue;
    ufoPozicioX[idx] += ufoEltolasOldalra;
    if (balMargo >= ufoPozicioX[idx]) {
      ufoEltolasOldalra = UFO_SEBESSEG;
      ufoMozogLe = true;
      break;
    }
    if (jobbMargo <= ufoPozicioX[idx]) {
      ufoEltolasOldalra = -UFO_SEBESSEG;
      ufoMozogLe = true;
      break;
    }
  }
}

void ufoMozgatLefele() {
  if (!ufoMozogLe)
    return;
  ufoMozogLe = false;
  for (int idx = 0; idx < ufoPozicioY.length; ++idx) {
    if (0 > ufoPozicioY[idx])
      continue;
    ufoPozicioY[idx] += ufoMagassag;
  }
}

void keyPressed() {
  if ('A' == keyCode) {
    fegyverPozicioX += -13;
  } else
    if ('D' == keyCode) {
    fegyverPozicioX += +13;
  } else
    if (' ' == keyCode) {
    LezerLoves();
    LovestEllenoriz();
  } else
    if ('R' == keyCode) {
    setup();
  }
}

void mouseMoved() {
  fegyverPozicioX = mouseX - mousePrevX;
}

void LovestEllenoriz() {
  for (int idx = 0; idx < ufoPozicioX.length; ++idx) {
    if (0 > ufoPozicioX[idx])
      continue;

    if (ufoPozicioX[idx] - ufoSzelesseg / 2 < fegyverPozicioX && fegyverPozicioX < ufoPozicioX[idx] + ufoSzelesseg / 2)
      ufoPozicioX[idx] = -1;
  }
}

void draw() {
  background(#000000);

  ufoMozgatOldalra();
  ufoMozgatLefele();

  ufoRajzol();
  fegyverRajzol();
}
