Madarka madar;
Akadaly akadaly;
Game game;

void setup() {
  size(800, 600);
  noStroke();

  madar = new Madarka();
  game  = new Game(madar);
}

void draw() {
  background(19, 23, 35);

  game.madarkaRajzolas();
  game.akadalyRajzolas();

  // Ha a madarke eletben van
  if (madar.eletben) {
    akadaly = game.legszelsoAkadaly;

    // megnezzuk nekiment-e a bal szelso oszlopnak, vagy kiesett-e a kepernyobol
    if (madarkaNekiment(akadaly, madar) || madarkaKiesett(madar)) {
      madar.elpusztit();
      game.sebesseg = 0;
    }

    // megnezzuk atment-e a balszelso oszlopon
    if (madarkaAtreplut(akadaly, madar)) {
      game.pontszamFrissit();
      game.szintetFrissit();
    }

    game.infoCsik();
  }
  // Madarka meghalt kiirjuk a vegeredmenyt
  else {
    game.vegeredmeny();
  }
}

boolean madarkaNekiment(Akadaly akadaly, Madarka madar) {
  return madar.eletben && akadaly.utkozesMadarkaval(madar);
}

/**
 * A madarka akkor elte tul az akadalyt, ha a bal szele
 * tujutott az akadaly jobb szelen.
 */
boolean madarkaAtreplut(Akadaly akadaly, Madarka madar) {
  float madarBal = madar.x - madar.d / 2;
  float akadalyJobb = akadaly.felsoNegyszog.x + akadaly.felsoNegyszog.w;

  if (!akadaly.madarkaAthaladt && madarBal > akadalyJobb) {
    akadaly.madarkaAthaladt = true;
    return true;
  }

  return false;
}

boolean madarkaKiesett(Madarka madar) {
  float r = madar.d / 2;
  return madar.y - r > height || madar.y + r < 0;
}

void keyReleased() {
  if (key == ' ') {
    if (madar.eletben) {
      madar.hopp();
    } else {
      madar.reset();
      game.reset();
    }
  }
}
