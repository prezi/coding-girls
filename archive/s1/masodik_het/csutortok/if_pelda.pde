/*
Feladat: rajzoljunk egy atlot a vaszonra.
 Ha az eger az atlotol balra van, a hatter legyen piros, 
 ha at atlotol jobbra van, akkor pedig zold.
 (vagy valaszthattok ket tetszoleges masik szint)
 */

void setup() {
  size(400, 400);
}

void draw() {
  // if - else szerkezet
  // http://www.processing.org/reference/if.html
  // http://www.processing.org/reference/else.html
  if (mouseX < mouseY) {
    background(255, 0, 0);
  } 
  else {
    background(0, 255, 0);
  }
  // egyenes kirajzolasa. A ket vegpont koordinatajat kell megadni
  // http://www.processing.org/reference/line_.html
  line (0, 0, width, height);
}
