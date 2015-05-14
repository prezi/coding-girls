void setup() {
  size(800, 800);
  background(0, 50, 50);

  int x = 50; // x koordinátája az első négyzet bal felső sarkának
  int y = 100; // y koordinátája az első négyzet bal felső sarkának
  int w = 100; // a négyzet szélessége
  int h = 50; // a négyzet magassága
  int diff = 20; // két házikó közti távolság
  
  for (int j=0; j < 3; j++ ) {
    for (i = 0; x < width - w; i++) {
      fill(#E6EB6E);
      rect(x, y, w, h);
      fill(#E04410);
      triangle(x, y, x + w, y, x + w/2, y - h);
      x += w + diff; // x = x + w + diff
    }
    x = 50;
    y += h + w/2 + diff;
  }
}

