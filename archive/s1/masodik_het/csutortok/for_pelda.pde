/*
Feladat:
 Sorhaz:
 Rajzoljunk egymas melle 5 hazat (kod ismetlese nelkul).
 Ket haz kozott mindig 50 pixel tavolsag legyen.
 */
void setup() {
  size(800, 400);
}

void draw() {
  background(#B2ECED);
  // haz, x koordinataval parameterezve
  // a hat legyen 100 pixel szeles, es 50 pixel magas (mind a teglalap, mind a teto)   
  int w = 100;
  int h = 50;

  int distance = 50;
  int x = 50;
  int y = 200;
  int i;

  for (i = 1; i<=5; i=i+1) {
    // a haz fala, legyen sarga
    // fill: megmondhatju, hogy innentol kezdve milyen szinure szinezze az alakzatokat (a kovetkezo fill-ig art a hatasa)
    // http://www.processing.org/reference/fill_.html
    fill(#E6EB6E);
    // teglalap rajzolasa: megadjuk a bal felso sarok koordinatain, majd szelesseget es a magassagot
    // http://www.processing.org/reference/rect_.html
    rect(x, y, w, h);
    // a haz teteje, legyen piros
    fill(#E04410);
    // haromszog: mindharom pont koordinatait felsoroljuk 
    // http://www.processing.org/reference/triangle_.html
    triangle(x, y, x+w, y, x+w/2, y-h); 
    // megadjuk, hol kezdodjon a kovetkezo haz
    x = x + w + distance;
  }


  
  // ezzel teljesen egyezo megoldas
  // nincs szukseg i-re, eleve az x valtozot frissitgetjuk
  int x_start = x;
  for (x = 50; x <= x_start + 5 *(w + distance); x = x + w + distance) {
    fill(#E6EB6E);
    rect(x, y, w, h);
    fill(#E04410);
    triangle(x, y, x+w, y, x+w/2, y-h); 
  }
}