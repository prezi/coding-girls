/**
 * Az akadaly tartalmazza a felso es az alsoNegyszog negyszog
 * es azt a reszt amin a madarka at tud repulni.
 *          [] <= Felso negyszog
 * (madar)     <= Res
 *          [] <= Also negyszog
 */
class Akadaly {
  // Az akadaly x koordinataja
  float x;

  // Akadaly reszei
  Negyszog res, felsoNegyszog, alsoNegyszog;

  // Ebbol tudjuk, hogy a madarka athaladt a resen.
  boolean madarkaAthaladt;

  color akadalySzine = color(255, 240, 207);
  color resAlapSzine = color(73, 174, 192, 100);
  color resOkSzine = color(202, 255, 155, 100);

  final float resmagassag = 200;
  final float szelesseg = 75;

  Akadaly() {
    this.reset();
  }

  void rajzol() {
    this.res.x = this.x;
    this.res.c = this.madarkaAthaladt ? this.resOkSzine : this.resAlapSzine;
    this.res.rajzol();

    this.felsoNegyszog.x = this.x;
    this.felsoNegyszog.c = this.akadalySzine;
    this.felsoNegyszog.rajzol();

    this.alsoNegyszog.x = this.x;
    this.alsoNegyszog.c = this.akadalySzine;
    this.alsoNegyszog.rajzol();
  }

  void reset() {
    this.madarkaAthaladt = false;

    // Eloszor megcsinaljuk a rest amin a madarka atmehet
    this.res = this.generaljRest();

    // A felso negyszog a kepernyo tetejetol a res tetejeig er
    this.felsoNegyszog = new Negyszog(this.x, 0, this.szelesseg, this.res.y);

    // Az also negyszog a res aljatol a kepernyo aljaig er.
    float alsoY = this.res.y + this.res.h;
    float alsoMagassag = height - (this.felsoNegyszog.h + this.res.h);
    this.alsoNegyszog = new Negyszog(this.x, alsoY, this.szelesseg, alsoMagassag);
  }

  /**
   * Utkozes a felso vagy az also negyszoggel
   */
  boolean utkozesMadarkaval(Madarka madar) {
    return this.utkozes(felsoNegyszog, madar.x, madar.y, madar.d)
        || this.utkozes(alsoNegyszog, madar.x, madar.y, madar.d);
  }

  /**
   * Megmondja az akadalynak, hogy milyen tavolsagbol kovesse az elotte levo akadalyt.
   */
  void kovesse(Akadaly akadaly, float minimumTavolsag) {
    float maradekTav = width - akadaly.x;
    float tavolsag = minimumTavolsag - maradekTav;

    this.x = tavolsag < 0 ? width : width + tavolsag;
  }

  /**
   * Vegzett az akadaly, ha jobb szele eltunt a kepernyo bal szelen
   */
  boolean vegzett() {
    return this.x + this.szelesseg < 0;
  }

  /**
   * Altalanos utkozes egyszerusitve negyszog - negyszog utkozesre..
   */
  private boolean utkozes(Negyszog rect, float bx, float by, float bd) {
    float r = bd / 2;

    boolean intersectX = bx + r > rect.x && bx - r < rect.x + rect.w;
    boolean intersectY = by + r > rect.y && by - r < rect.y + rect.h;

    return intersectX && intersectY;
  }

  /**
   * Megcsinalja a reskent szolgalo random teglalapot
   */
  private Negyszog generaljRest() {
    float y = (height - this.resmagassag) * random(0.1, 0.9);
    return new Negyszog(this.x, y, this.szelesseg, this.resmagassag);
  }


}

class Negyszog {
  float x, y, w, h;
  color c = color(0);

  Negyszog(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void rajzol() {
    pushStyle();
      fill(this.c);
      rect(this.x, this.y, this.w, this.h);
    popStyle();
  }
}
