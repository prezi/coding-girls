/*
Feladat:
toltsunk be egy kepet. 
A kep lassan, fokozatosan kovesse a kurzor mozgasat. Cel: a kep bal felso sarka illeszkedjen a kurzorra
*/



// ezek a valtozok globalis valtozok.
// ez azt jelenti, hogy mindenki ismerni fogja oket ebben a kodban. (a setup-ban es a draw-ban is vatran hasznalhatjuk oket)
  PImage icon;
  int cursorX;
  int cursorY;
  int iconX;
  int iconY;
  
void setup(){
  size(600, 600);

  icon = loadImage("http://media-cache-ec0.pinimg.com/avatars/simonscat-1371036747_30.jpg");
  
  // ha meg szerernenk erteni jobban a kepunk mozgasat, lassithatjuk a kirajzolas sebesseget.
  // a draw() annyiszor fog meghivodni, amilyen szamot a framerate-nek beirunk.
  // ez peldaul masodpercenkent egyszer fog rajzolni:
  //frameRate(1);
}

void draw(){
  
  background(#8F98D9);
  cursorX = mouseX;
  cursorY = mouseY;
  
  // kiszamoljuk, mekkorat lepunk, mennyire kozelitsuk az aktualis pillanatban a kurzort.
  // otlet: a tavolsagot mindig 10%-kal csokkentsuk

  // stepX, stepY megmondja, hany pixellel fogunk kozelebb kerulni a kurzorhoz ebben a lepesben.
  int stepX;
  int stepY;
  // ratio tarolja, hany %-kal akarjuk csokkenteni a tavolsagot. (0.1 ratio jelenti a 10%-os csokkenest)
  // ez egy valos szam, ennek tipusa float lesz.
  float ratio = 0.1; 

  // matematikai formula (Gondold vegig, miert!) alapjan kiszamoljuk stepX, stepY erteket
  stepX = (cursorX - iconX) * ratio;
  stepY = (cursorY - iconY) * ratio;
  
  // a kep felso sarkanak koordinatajat kiszamoljuk: hozzaadjuk a step merteket.
  // figyelj! eloszor kiszamolodik a jobb oldal (tehat az osszeadas), es utana frissitul az iconX erteke
  iconX = iconX + stepX;
  iconY = iconY + stepY;
  
  //kep kirajzolasa
  image(icon, iconX, iconY);  
}