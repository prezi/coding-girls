//gorillak
float gorillaX[];
float gorillaY[];
PImage gorilla[];
float gorillaWidth;
float gorillaHeight;


// ki jon?
// ez a valtozo  0 ha az elso gorill ajon es 1 ha a masodik
int turng;

//banan
float bananX;
float bananY;
float bananMeret;

// a banan sebessege
float bananSebX;
float bananSebY;
PImage banana;
boolean kiVanLove;

float gravitacio;
PImage explosion;
boolean isGameOver;

// lesznek hazak. az X a bal felso sarkuk, az Y a magassaguk
float hazakX[];
float hazakY[];
color hazakSzine[];
int hazakSzama;
float kraterekX[];
float kraterekY[];
int kraterekSzama;
float kraterAtmero; 

int precision;

void setup() {
  size(900, 600);

  hazakSzama=10;
  hazakX= new float[hazakSzama];
  hazakY= new float[hazakSzama];
  hazakSzine = new color[hazakSzama];
  for (int i=0; i<hazakSzama; i++) {
    // TBD: hogyan lehetnenek a hazak random szelesseguek?

    hazakX[i]=i*width/hazakSzama;

    float hazSzelesseg=width/hazakSzama;
    hazakY[i]= random(abs(hazakX[i]+hazSzelesseg/2-width/2)+50, height*7/8);
    hazakSzine[i]= color(random(0, 255), random(0, 255), random(0, 255));
  }

  kraterekX=new float[1];
  kraterekY=new float[1];
  kraterekSzama=0;
  kraterAtmero=50;

  gorillaX=new float[2];
  gorillaY=new float[2];
  gorilla= new PImage[2];
  gorillaWidth=75;
  gorillaHeight=85;

  // a gorillak alljanak a hazak tetejen
  gorillaX[0]=width-gorillaWidth;
  gorillaY[0]=hazakY[hazakSzama-1]-gorillaWidth;
  gorilla[0]=loadImage("cartoongorilla01-filtered.png");

  gorillaX[1]=0;
  gorillaY[1]=hazakY[0]-gorillaHeight;
  gorilla[1]=loadImage("cartoongorilla01-filtered-mirror.png");

  banana = loadImage("banana-hi.png");
  bananMeret=30;
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

  precision=50;
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
  bananX+=bananSebX*1/precision;
  bananY+=bananSebY*1/precision;
  bananSebY+=gravitacio*1/precision;
}

// ellenorizzuk, hogy a banan a palyan van-e
boolean bananKintVan() {
  boolean ret =false;
  if (bananX<0 || bananX>width|| bananY>height) { 
    ret=true;
  }
  // azt is ellenorizzuk, hogy nincs-e valamelyik hazban
  float hazSzelesseg=width/hazakSzama;
  for (int i=0; i<hazakSzama; i++) {
    if (bananX>hazakX[i] && bananX<hazakX[i]+hazSzelesseg) {
      if (bananY>hazakY[i]) {
        ret=true;
      }
    }
  }
  return ret;
}

boolean bananHazatEr() {
     
  boolean ret=false;
  // azt is ellenorizzuk, hogy nincs-e valamelyik hazban
  float hazSzelesseg=width/hazakSzama;
  for (int i=0; i<hazakSzama; i++) {
    if (bananX>hazakX[i] && bananX<hazakX[i]+hazSzelesseg) {
      if (bananY>hazakY[i]) {
          ret=true;
        }
      }
    }
  return ret;
}

boolean kraterbenVan() {
  boolean ret=false;
  for (int i=0; i<kraterekSzama; i++) {
    if (sqrt(pow(abs(bananX-kraterekX[i]), 2) + pow(abs(bananY-kraterekY[i]), 2))<kraterAtmero/2 ) {
      ret=true;
    }
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
    bananX+=(gorillaWidth-10);
  }
}

// igaz akkor, ha a banan eltalat egy gorillat
boolean talalat(int i) {
  if (bananX>gorillaX[i]&& bananX<(gorillaX[i]+gorillaWidth) && bananY>gorillaY[i] && bananY<(gorillaY[i]+gorillaHeight)) {
    return true;
  }
  return false;
}

void ujKrater() {
  kraterekX[kraterekSzama]=bananX;
  kraterekY[kraterekSzama]=bananY;

  fill(#24048E);
  noStroke();
  ellipse(kraterekX[kraterekSzama], kraterekY[kraterekSzama], kraterAtmero, kraterAtmero);
  kraterekSzama+=1;
  if (kraterekSzama==kraterekX.length) {
    megTobbKratert();
  }
}

void megTobbKratert() {
  float tempX[]= new float[kraterekSzama];
  float tempY[]= new float[kraterekSzama];
  for (int i=0; i<kraterekSzama; i++) {
    tempX[i]=kraterekX[i];
    tempY[i]=kraterekY[i];
  }
  kraterekX=new float[kraterekSzama*2]; 
  kraterekY=new float[kraterekSzama*2];
  for (int i=0; i<kraterekSzama; i++) {
    kraterekX[i]=tempX[i];
    kraterekY[i]=tempY[i];
  }
}

void keyPressed() {
  if (isGameOver) {
    setup();
    loop();
  }
}

void gameOver() {

  isGameOver=true;

  fill(#ff0000);
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


void drawTerrain() {
  //hatter kirajzolasa
  background(#24048E);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );

  // hazak rajzolasa
  stroke(#000000);
  strokeWeight(3);
  for (int i=0; i<hazakSzama; i++) {
    fill(hazakSzine[i]);
    rect(hazakX[i], hazakY[i], width/hazakSzama, height-hazakY[i]);
  }

  noStroke();
  for (int i=0; i<kraterekSzama; i++) {
    fill(#24048E);
    ellipse(kraterekX[i], kraterekY[i], kraterAtmero, kraterAtmero);
  }
}

void preciseAnimate() {
  //banan kirajzolasa
  image(banana, bananX-bananMeret/2, bananY-bananMeret/2, bananMeret, bananMeret);
 
  // ezeket a dolgokat csak akkor erdemes megcsinalni, ha megy a jatek
  if (kiVanLove) {
    moveBanana();


    //ha leesett a banan, akkor mi tortenjen?
    if (bananKintVan() && !kraterbenVan()) {
      if (bananHazatEr()) {
        ujKrater();
      }

      //megint lehet loni
      kiVanLove=false;
      //innentol  masik gorilla jon
      masikJon();
      // tegyuk vissza a banant
      bananMasikGorillahoz();
    }
  }
}


void draw() {
  drawTerrain();

  for (int i=0; i<2; i++) {
    // itt fontos a teszteles sorrendje
    // ha nincs talalat, gorillat rajzolunk, ha van, akkor robbanast
    // a gameOver fuggvenyben a noloop megallitja a draw ismetleset
    // de azert ez a ciklus meg lefut vegig
    if (!talalat(i)) { 
      image(gorilla[i], gorillaX[i], gorillaY[i], gorillaWidth, gorillaHeight);
    } else {
      image(explosion, gorillaX[i], gorillaY[i], gorillaWidth, gorillaHeight);
      gameOver();
    }
  }

  if (!isGameOver) {
    for (int i=0; i<precision; i++) {
      preciseAnimate();
    }
  }
}

