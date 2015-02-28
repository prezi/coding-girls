//gorillak
float gorilla1X;
float gorilla1Y;
PImage gorilla1;
float gorilla2X;
float gorilla2Y;
PImage gorilla2;
// ki jon?
// ez a valtozo akkor legyen igaz, ha az 1es gorilla jon
boolean turng1;

//banan
float bananX;
float bananY;

// a banan sebessege
float bananSebX;
float bananSebY;
PImage banana;
boolean kiVanLove;

float gravitacio;
PImage explosion;

void setup() {
  size(900, 600);

  gorilla1X=750;
  gorilla1Y=height*6/8;
  gorilla1=loadImage("cartoongorilla01-filtered.png");

  gorilla2X=0;
  gorilla2Y=height*6/8;
  gorilla2=loadImage("cartoongorilla01-filtered-mirror.png");

  bananX=gorilla1X;
  bananY=gorilla1Y;
  bananSebX=0;
  bananSebY=0;
  banana = loadImage("banana-hi.png");
  kiVanLove=false;

  gravitacio=0.5;

  turng1=true;
  explosion=loadImage("explosion.png");
}

// mi tortenjen, ha lenyomjuk az egergombot?

void mouseClicked() {
  // barmi csak akkor, ha epp nincs kilove a banan
  if (kiVanLove==false) {
    //szamolunk sebessegvektort az eger es a banan helyzetenek kulonbsegebol
    float sebX= mouseX- bananX;
    float sebY= mouseY - bananY;
    // kilojuk a banant
    bananSebX=sebX*0.1;
    bananSebY=sebY*0.1;

    kiVanLove=true;
  }
}

void moveBanana() {
  bananX+=bananSebX;
  bananY+=bananSebY;
  bananSebY+=gravitacio;
}

// ellenorizzuk, hogy a banan a palyan van-e
boolean bananKintVan() {
  boolean ret =false;
  if (bananX<0 || bananX>width|| bananY>height) { 
    ret=true;
  }
  return ret;
}

void bananMasikGorillahoz() {
  if (turng1) {
    bananX=gorilla1X;
    bananY=gorilla1Y;
  } else {
    bananX=gorilla2X+120;
    bananY=gorilla2Y;
  }
  bananSebX=0;
  bananSebY=0;
}

// igaz akkor, ha a banan eltalat egy gorillat
boolean talalat1() {
  if (bananX>gorilla1X&& bananX<(gorilla1X+100) && bananY>gorilla1Y && bananY<(gorilla1Y+120)) {
    return true;
  }
  return false;
}


boolean talalat2() {
  if (bananX>gorilla2X && bananX<(gorilla2X+100) && bananY>gorilla2Y && bananY<(gorilla2Y+100)) {
    return true;
  }
  return false;
}

void gameOver() {
  background(#24048E);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );

  textSize(32);
  text("Game Over", width/2, height/2);
}

void draw() {
  //hatter kirajzolasa
  background(#24048E);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );

  //gorillak kirajzolasa
  image(gorilla1, gorilla1X, gorilla1Y, 150, 150);
  image(gorilla2, gorilla2X, gorilla2Y, 150, 150);
  //banan kirajzolasa
  image(banana, bananX, bananY, 33, 33);

  if (kiVanLove) {
    moveBanana();
  }


  // ha talalat van, vege a jateknak
  if (talalat1()) { 
    gameOver();
    image(explosion, gorilla1X, gorilla1Y, 150, 150);
    noLoop();
  }

  if (talalat2()) {
    gameOver();
    PImage explosion=loadImage("explosion.png");
    image(explosion, gorilla2X, gorilla2Y, 150, 150);
    noLoop();
  }

  //ha leesett a banan, akkor mi tortenjen?
  if (bananKintVan()) {
    //megint lehet loni
    kiVanLove=false;

    //innentol  masik gorilla jon
    if (turng1) {
      turng1=false;
    } else {
      turng1=true;
    }
    // tegyuk vissza a banant
    bananMasikGorillahoz();
  }
}

