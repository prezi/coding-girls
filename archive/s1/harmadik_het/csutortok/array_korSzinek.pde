void setup() {
  size(800, 800);
  background(0,255,0);
  
  
  // kiválasztunk pár színt, és ezekkel fogunk köröket rajzolni
  Array szinek = {#000000, #FF0000, #00FF00, #0000FF, #FFFF00, #00FFFF, #FF00FF, #C0C0C0, #FFFFFF};
  
  int korSzam = szinek.length; //ennyi db ellipszist rajzoljon ki
  int w = width; // ilyen széles legyen az ellipszis
  int h = height; // ilyen magas legyen az ellipszis
  
  for(i = 0; i < korSzam; i++) {
    fill(szinek[i]);
    ellipse(width/2, height/2, w, h);
    
    w -= width / korSzam; // w = w - width / korSzam
    h -= height / korSzam; // h = h - height / korSzam
  }
  
}
