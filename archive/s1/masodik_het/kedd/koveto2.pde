/*
Feladat:
toltsunk be egy kepet. 
A kep kovesse a kurzor mozgasat: a kep kozepe illeszkedjen a kurzorra
*/

  PImage icon;
  int cursorX;
  int cursorY;

  // a kep bal felso sarkanak koordinatait is taroljuk
  int iconX;
  int iconY;
  
void setup(){
  size(600, 600);
  // betolthetunk kepet url-bol is (ha van internet kapcsolatod)
  icon = loadImage("http://media-cache-ec0.pinimg.com/avatars/simonscat-1371036747_30.jpg");
}

void draw(){
  background(#8F98D9);
  cursorX = mouseX;
  cursorY = mouseY;
  println(cursorX + "," + cursorY);
  
  // egyszeru matematikai formulaval kiszamoljuk a kep felso sarkat (Gondold vegig magad! Papir, ceruza hasznalhato :) )
  // tudjuk, hol lesz a kep kozepe: ahova az eger mutat
  // a kep tudja magarol a mereteit. mi ezt igy erjuk el: 
  // szelesseg: icon.width
  // magassag: icon.height 

  iconX = cursorX - icon.width/2; 
  iconY = cursorY - icon.height/2;
  
  image(icon, iconX, iconY);  
}