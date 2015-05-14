 /*
Feladat:
toltsunk be egy kepet. 
A kep lassan, fokozatosan kovesse a kurzor mozgasat. Cel: a kep kozepe sarka illeszkedjen a kurzorra
(Azaz: az elozo ket feladatot gyurjuk ossze!)
*/

  PImage icon;
  int cursorX;
  int cursorY;
  int iconX;
  int iconY;
  
void setup(){
  size(600, 600);

  icon = loadImage("http://media-cache-ec0.pinimg.com/avatars/simonscat-1371036747_30.jpg");
}

void draw(){
  
  background(#8F98D9);
  cursorX = mouseX;
  cursorY = mouseY;
  
  println(cursorX + "," + cursorY);

  int stepX;
  int stepY;
  float ratio = 0.1; 

  // gondold vegig matematikailag, mit kell csinalni!
  // iconX, iconY a kep bal felso sarkat tarolja. Viszont mi a kep kozepet szeretnenk mozgatni. 
  // vezessunk be erre ket uj valtozot, amik a kep kozepenek koordinatajat irjak le: centerX, centerY
  int centerX; 
  int centerY;

  // ugyanazt a transzformaciot hajtjuk rajta vegre, amit az elozo peldaban a kep sarkaval.
  // gondol vegig, miert. Ez matek, ne ijedj meg tole. Papir, ceruza elo!
  centerY = iconY + icon.height/2;
  centerX= iconX + icon.width/2;
  
  // most a lepest a kozepponttol szamoljuk, de hasonloan, mint az elobb. 
  // gondolj arra, hogy egy eltolas vektort szamolunk
  stepX = (cursorX - centerX) * ratio;
  stepY = (cursorY - centerY) * ratio;
  
  // vegul a stepX, stepY felhasznalasaval frissijuk a kep bal felso sarkanak koordinatait.
  iconX = iconX + stepX;
  iconY = iconY + stepY;
  
  //kep kirajzolasa
  image(icon, iconX, iconY);  
}