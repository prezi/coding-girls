//gorillak
float gorillaX[];
float gorillaY[];
PImage gorilla[];


// ki jon?
// ez a valtozo  0 ha az elso gorill ajon es 1 ha a masodik
int turng;

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
boolean isGameOver;

void setup() {
  size(900, 600);

  gorillaX=new float[2];
  gorillaY=new float[2];
  gorilla= new PImage[2];

  gorillaX[0]=750;
  gorillaY[0]=height*6/8;
  gorilla[0]=loadImage("cartoongorilla01-filtered.png");

  gorillaX[1]=0;
  gorillaY[1]=height*6/8;
  gorilla[1]=loadImage("cartoongorilla01-filtered-mirror.png");


  banana = loadImage("banana-hi.png");
 
  // nem tul szep trukk: a turng-t NEM allijuk be
  // magatol legeloszor 0 lesz, 
  // es kesobb az erteke meg az marad ami epp
  // igy meg ha meghivjuk a setup fuggvenyt ujra, akkor se veszik el az erteke
  //turng=0;
  kiVanLove=false;
  bananMasikGorillahoz();

  gravitacio=0.5;

  explosion=loadImage("explosion.png");
  isGameOver=false;
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
  bananX=gorillaX[turng];
  bananY=gorillaY[turng];
  bananSebX=0;
  bananSebY=0;

  // a bal oldali gorillanal mashova kell tenni a banant
  if (turng==1) {
    bananX+=120;
  }
}

// igaz akkor, ha a banan eltalat egy gorillat
boolean talalat(int i) {
  if (bananX>gorillaX[i]&& bananX<(gorillaX[i]+150) && bananY>gorillaY[i] && bananY<(gorillaY[i]+150)) {
    return true;
  }
  return false;
}


void keyPressed() {
  if (isGameOver) {
    setup();
    loop();
  }
}

void gameOver() {
  isGameOver=true;
  textSize(32);
  text("Game Over", width/2, height/2);

  textSize(16);
  text("press any key to continue", width/2, height*2/3);

  noLoop();
}

void masikJon() {
  if (turng==0) {
    turng=1;
  } else {
    turng=0;
  }
}


void draw() {
  //hatter kirajzolasa
  background(#24048E);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );



  for (int i=0; i<2; i++) {
    // itt fontos a teszteles sorrendje
    // ha nincs talalat, gorillat rajzolunk, ha van, akkor robbanast
    // a gameOver fuggvenyben a noloop megallitja a draw ismetleset
    // de azert ez a ciklus meg lefut vegig
    if (!talalat(i)) { 
      image(gorilla[i], gorillaX[i], gorillaY[i], 150, 150);
    } else {
      image(explosion, gorillaX[i], gorillaY[i], 150, 150);
      gameOver();
    }
  }

  if (!isGameOver) {
    //banan kirajzolasa
    image(banana, bananX, bananY, 33, 33);

    // ezeket a dolgokat csak akkor erdemes megcsinalni, ha megy a jatek
    if (kiVanLove) {
      moveBanana();
    }

    //ha leesett a banan, akkor mi tortenjen?
    if (bananKintVan()) {
      //megint lehet loni
      kiVanLove=false;
      //innentol  masik gorilla jon
      masikJon();
      // tegyuk vissza a banant
      bananMasikGorillahoz();
    }
  }
}

