/*
Feladat:
toltsunk be egy kepet. 
A kep kovesse a kurzor mozgasat: a kep bal felso sarka illeszkedjen a kurzorra
*/

  // a kepet tarolo valtozo
  // PImage tipusu
  PImage icon;

  // a kurzor x es y koordinatait tarolo valtozok.
  // egesz szamok, erre az "int" tipust hasznaljuk 
  int cursorX;
  int cursorY;
  
// setup fuggveny csak egyszer fut le, mindennek a kezdetekor  
void setup(){
  // beallitjuk a hatter meretet.
  size(400, 400);

  // betolthetunk kepet url-bol (ha van internet kapcsolatod)
  // http://www.processing.org/reference/loadImage_.html
  icon = loadImage("http://media-cache-ec0.pinimg.com/avatars/simonscat-1371036747_30.jpg");

}

// a draw fuggveny mp-enkent 60-szor hajtodik vegre. 
void draw(){

  // a hatter szinet beallitjuk 
  // http://processing.org/reference/background_.html
  // ha szep szint szerepnek kikeverni, annak a hexadecimalis kodjat vagy RGB kodjat itt kikeresheted:
  //   http://www.colorpicker.com/
  background(#8F98D9);
  // Tipp: probald ki, mi tortenik, ha a backgroundot nem itt allitod be, hanem a setup-ban. Mit gondolsz, miert?

  // cursorX, cursorY-ba betoltjuk az eger aktualis koordinatait
  cursorX = mouseX;
  cursorY = mouseY;
  
  // kiirjuk a kurzor koordinatait
  println(cursorX + "," + cursorY);
  
  // kirajzoljuk a kepet. 
  // (cursorX, cursorY) a kep bal felso sarkat hatarozza meg.
  // angolul tobb info:
  // http://www.processing.org/reference/image_.html
  image(icon, cursorX, cursorY);
   

}