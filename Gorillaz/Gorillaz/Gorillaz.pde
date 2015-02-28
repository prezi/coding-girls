//gorillak
float gorilla1X;
float gorilla1Y;
PImage gorilla1;

//banan
float bananX;
float bananY;

// a banan sebessege
float bananSebX;
float bananSebY;
PImage banana;
boolean kiVanLove;

float gravitacio;

void setup() {
  size(800, 600);

  gorilla1X=700;
  gorilla1Y=height*6/8;
  gorilla1=loadImage("cartoongorilla01-filtered.png");

  bananX=gorilla1X;
  bananY=gorilla1Y;
  bananSebX=0;
  bananSebY=0;
  banana = loadImage("banana-hi.png");
  kiVanLove=false;

  gravitacio=0.5;
}

// mi tortenjen, ha lenyomjuk az egergombot?
void mouseClicked() {
  //szamolunk sebessegvektort az eger es a banan helyzetenek kulonbsegebol
  float sebX= mouseX- bananX;
  float sebY= mouseY - bananY;
  // kilojuk a banant

  bananSebX=sebX*0.1;
  bananSebY=sebY*0.1;

  kiVanLove=true;
}

void moveBanana() {
  bananX+=bananSebX;
  bananY+=bananSebY;
  bananSebY+=gravitacio;
}

void draw() {
  //hatter kirajzolasa
  background(#24048E);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );

  //gorilla kirajzolasa
  image(gorilla1, gorilla1X, gorilla1Y, 150, 150);
  //banan kirajzolasa
  image(banana, bananX, bananY, 33, 33);

  if (kiVanLove) {
    moveBanana();
  }
}

