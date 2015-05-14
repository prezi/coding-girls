void setup() {
  size(800, 800);
  background(0,255,0);
  
  int korSzam = 5; //ennyi db ellipszist rajzoljon ki
  int w = width; // ilyen széles legyen az ellipszis
  int h = height; // ilyen magas legyen az ellipszis
  
  int red = 0; //ennyire legyen piros
  
  for(i = 1; i <= korSzam; i++) {
    fill(red, 0, 0);
    ellipse(width/2, height/2, w, h);
    
    w -= width / korSzam; // w = w - width / korSzam
    h -= height / korSzam; // h = h - height / korSzam
    red += 255 / korSzam; // red = red + 255 / korSzam
  }
  
}
