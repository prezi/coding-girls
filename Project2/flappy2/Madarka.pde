class Madarka {
  // Madarka atmeroje
  float d = 40;
  // Madarka x koordinataja.
  float x = 100;
  // Madarka y koordinataja. A kepernyo tetejerol indul
  float y;

  color madarSzin = color(254, 90, 39);

  float gyorsulas;
  float gravitacio;

  // Innen tudjuk, hogy kinyirtuk-e mar a madarkat.
  boolean eletben;

  Madarka() {
    this.reset();
  }

  void reset() {
    this.eletben = true;
    this.y = this.d;
    this.gyorsulas = 0;
    this.gravitacio = 0.1;
  }

  /**
   * Kirajzolja a madarkat
   */
  void rajzol() {
    float r = this.d / 2;
    // A push- es a popStyle gondoskodik arrol, hogy csak a madarka legyen rozsaszin.
    pushStyle();
      stroke(0, 0, 0, 100);
      fill(this.madarSzin);
      ellipse(this.x, this.y, this.d, this.d);
    popStyle();
  }

  /**
   * Kiszamolja, hogy hova kell legkozelebb kirajzolni a madarkat.
   */
  void mozgat() {
    this.y += this.gyorsulas;
    this.gyorsulas += this.gravitacio;
  }

  void hopp() {
    this.gyorsulas = -4;
  }

  void elpusztit() {
    this.gyorsulas = -8;
    this.eletben = false;
  }

  void feltamaszt() {
    this.gyorsulas = 0;
    this.y = height / 2 + d;
    this.eletben = true;
  }

}
