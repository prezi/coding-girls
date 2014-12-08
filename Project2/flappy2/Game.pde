class Game {
  int pontszam;
  int szint;
  int maxPontszam;
  float sebesseg;

  PFont font;
  String gameOverText = "Game Over!";
  String highScoreText = "New Highscore!";

  // Madarka
  Madarka madar;
  ArrayList<Float> elozoMadarak = new ArrayList<Float>();

  // Listaban tároljuk az összes akadályt
  ArrayList<Akadaly> akadalyok = new ArrayList<Akadaly>();
  Akadaly legszelsoAkadaly;

  Game(Madarka madar) {
    this.font = loadFont("Krungthep-36.vlw");
    textFont(this.font, 16);

    this.madar = madar;

    this.reset();
  }

  void reset() {
    this.pontszam = 0;
    this.szint = 1;
    this.sebesseg = 3;
    this.elozoMadarak.clear();
    this.akadalyGeneralas();
  }

  float kovetesiTavolsag() {
    return random(300, 400);
  }

  boolean madarkaRajzolas() {
    int size = this.elozoMadarak.size();

    fill(this.madar.madarSzin);
    for (int i = 0; i < size; i++) {
      float x = this.madar.x - (size - i);
      float y = this.elozoMadarak.get(i);
      float d = this.madar.d - (size - i);
      ellipse(x, y, d, d);
    }

    this.elozoMadarak.add(this.madar.y);

    if (size >= this.madar.d) {
      this.elozoMadarak.remove(0);
    }

    this.madar.mozgat();
    this.madar.rajzol();

    return true;
  }

  void akadalyGeneralas() {
    this.akadalyok.clear();

    for (int i = 0; i < 5; i++) {
      Akadaly akadaly = new Akadaly();
      // Az elso akadalyt a kepernyo jobb szelere tesszuk
      if (i == 0) {
        akadaly.x = width + i * akadaly.szelesseg;
      }
      // A tobbi akadaly mindig az elotte levot fogja kovetni
      else {
        akadaly.kovesse(this.akadalyok.get(i - 1), this.kovetesiTavolsag());
      }
      this.akadalyok.add(akadaly);
    }
  }

  void akadalyRajzolas() {
    this.legszelsoAkadaly = this.akadalyok.get(0);

    int size = this.akadalyok.size();
    for (int i = 0; i < size; i++) {
      Akadaly akadaly = this.akadalyok.get(i);

      // Ha az akadaly kiert a kepernyo bal szelere
      if (akadaly.vegzett()) {
        Akadaly elozo = this.akadalyok.get(i - 1 < 0 ? size - 1 : i - 1);

        // Visszaallitjuk
        akadaly.reset();
        // es megkerjuk, hogy kovesse az elotte levot
        akadaly.kovesse(elozo, this.kovetesiTavolsag());
      }
      // Ha az akadaly meg nem vegzett, folytatja az utjat a kepernyo bal oldala fele.
      else {
        akadaly.x = akadaly.x - game.sebesseg;
      }

      // Nyomontartjuk, hogy melyik a legszelso akadaly
      if (this.legszelsoAkadaly.x > akadaly.x) {
        this.legszelsoAkadaly = akadaly;
      }

      akadaly.rajzol();
    }
  }

  void pontszamFrissit() {
    this.pontszam += this.szint;

    if (this.maxPontszam <= this.pontszam) {
      this.maxPontszam = this.pontszam;
    }
  }

  void szintetFrissit() {
    // Minden harmadik oszlop utan noveljuk a sebesseget
    if (this.pontszam % 3 == 0 && this.szint < 25) {
      this.sebesseg += this.sebesseg * 0.1;
      this.szint++;
    }
  }

  void infoCsik() {
    pushStyle();
      // Eredmeny csik
      fill(0, 0, 0, 200);
      rect(0, 0, width, 20);

      // Eredmeny jelzo
      fill(255, 255, 255);
      text("szint: " + game.szint, 80, 16);
      text("max pont: " + game.maxPontszam, 180, 16);
      text(this.pontszam(), width - 80, 16);
    popStyle();
  }

  void vegeredmeny() {
    float tw;
    String pontszam = this.pontszam();
    String szoveg = (this.maxPontszam == this.pontszam) ? this.highScoreText : this.gameOverText;
    float lineHeight = 1.4;

    pushStyle();
      // Eredmeny kepernyo hatter
      fill(0, 0, 0, 200);
      rect(0, 0, width, height);

      // Game over es pontszam kiiras
      pushMatrix();
        translate(width / 2, height / 2);
        fill(255);
        textFont(this.font, 36);

        tw = textWidth(szoveg);
        text(szoveg, 0 - tw / 2, 0 - (36 / 2) * lineHeight);

        tw = textWidth(pontszam);
        text(pontszam, 0 - tw / 2, 0 + (36 / 2) * lineHeight);
      popMatrix();
    popStyle();
  }

  String pontszam() {
    String pontszam = "00000";

    if (game.pontszam <= 9) pontszam = "0000" + game.pontszam;
    else if (game.pontszam <= 99) pontszam = "000" + game.pontszam;
    else if (game.pontszam <= 999) pontszam = "00" + game.pontszam;
    else if (game.pontszam <= 9999) pontszam = "0" + game.pontszam;
    else pontszam = "" + game.pontszam;

    return pontszam;
  }

}