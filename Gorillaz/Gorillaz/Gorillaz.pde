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
float hazSzelesseg;
color ablakokSzine;
color ablakokSzine2;


color egitestekSzine;
color egSzine;
float holdX;
float holdY;
float csillagokX[];
float csillagokY[];
int csillagokSzama;


float kraterekX[];
float kraterekY[];
int kraterekSzama;
float kraterAtmero; 

int precision;

int robbanashelySzamlalo;
boolean robbanasCountdown;

void setup() {
  size(900, 600);

  //hazak
  hazakSzama=10;
  hazSzelesseg=width/hazakSzama;
  hazakX= new float[hazakSzama];
  hazakY= new float[hazakSzama];
  hazakSzine = new color[hazakSzama];
  ablakokSzine=color(#C6C931);
  ablakokSzine2=color(#858653);

  for (int i=0; i<hazakSzama; i++) {
    // TBD: hogyan lehetnenek a hazak random szelesseguek?
    hazakX[i]=i*width/hazakSzama;
    float hazSzelesseg=width/hazakSzama;
    hazakY[i]= random(abs(hazakX[i]+hazSzelesseg/2-width/2)+50, height*7/8);
    hazakSzine[i]= color(random(0, 255), random(0, 255), random(0, 255));
  }

  //hold es csillagok
  egitestekSzine=color(#FAF7B6);
  egSzine=color(#24048E);
  holdX=random(0, width);
  holdY=random(0, 200);

  csillagokSzama=500;
  csillagokX=new float[csillagokSzama];
  csillagokY=new float[csillagokSzama];
  for (int i=0; i<csillagokSzama; i++) {
    csillagokX[i]= random(0, width);
    //lehet, hogy lesz olyan csillag, ami hazra esik, azt majd eltakarjuk
    csillagokY[i]=random(0, height*7/8);
  }
  //tomb a kraterek nyilvantartasara
  kraterekX=new float[1];
  kraterekY=new float[1];
  kraterekSzama=0;
  kraterAtmero=50;

  //gorillak adatai
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

  // banan
  banana = loadImage("banana-hi.png");
  bananMeret=30;

  //gravitacio
  gravitacio=0.5;
  //robbanas
  explosion=loadImage("explosion.png");

  //szamolas pontossaga reajzolasok kozott
  precision=50;

  //jatek allapotai
  kiVanLove=false;
  bananMasikGorillahoz();
  isGameOver=false;
  robbanashelySzamlalo=100;
  robbanasCountdown=false;
  // nem tul szep trukk: a turng-t NEM allijuk be
  // magatol legeloszor 0 lesz, 
  // es kesobb az erteke meg az marad ami epp
  // igy meg ha meghivjuk a setup fuggvenyt ujra, akkor se veszik el az erteke
  //turng=0;
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
  bananX+=bananSebX*0.75/precision;
  bananY+=bananSebY*0.75/precision;
  bananSebY+=gravitacio*0.75/precision;
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

/*
boolean kraterbenVan() {
 boolean ret=false;
 for (int i=0; i<kraterekSzama; i++) {
 if (sqrt(pow(abs(bananX-kraterekX[i]), 2) + pow(abs(bananY-kraterekY[i]), 2))<kraterAtmero/2 ) {
 ret=true;
 }
 }
 return ret;
 }
 */

// masik valtozat a fuggvenybol: akarmirol meg tudja mondani, hogy kraterben van-e
// csillagrol vagy bananrol is
boolean kraterbenVan(float X, float Y) {
  boolean ret=false;
  for (int i=0; i<kraterekSzama; i++) {
    if (sqrt(pow(abs(X-kraterekX[i]), 2) + pow(abs(Y-kraterekY[i]), 2))<kraterAtmero/2 ) {
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

// akarhova tehessunk egy uj kratert
void ujKrater(float X, float Y) {
  kraterekX[kraterekSzama]=X;
  kraterekY[kraterekSzama]=Y;

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
  // fontos a sorrend: hatulrol elore rajzolunk
  // eloszor az eg 
  // aztan a csillagok
  // aztan a hazak
  // aztan a kraterek
  // aztan bonuszkent a kraterben levo csillagok

  background(egSzine);
  fill(#19CE57);
  rect(0, height*7/8, width, height*1/8 );

  // hold es csillagok
  noStroke();
  fill(egitestekSzine);
  ellipse(holdX, holdY, 55, 55);

  //csillagok
  for (int i=0; i<csillagokSzama; i++) {
    ellipse(csillagokX[i], csillagokY[i], 3, 3);
  }

  // hazak rajzolasa

  for (int i=0; i<hazakSzama; i++) {
    stroke(#000000);
    strokeWeight(3);
    fill(hazakSzine[i]);
    rect(hazakX[i], hazakY[i], hazSzelesseg, height-hazakY[i]);

    // ablakok rajzolasa, sok magic numberrel

    noStroke();
    for (float j=hazakX[i]+10; j<hazakX[i]+hazSzelesseg-7; j+=20.75) {
      for (float k=hazakY[i]+10; k<height-20; k+=45.15 ) {
        fill(ablakokSzine);
        if (((j*k)-floor(j*k))*10<2.5) {
          // itt egy kis matekos trukkozes van
          // azt szeretnem, hogy nemelyik ablak mas szinu legyen. randomot itt nem lehet hasznalni, mert akkor minden rajzolasnal mas ablak lenne sotet
          // azt csinalom, hogy a j+k szam tortreszenek elso szamjegyet vizsgalom, hogy egy bizonyos ertek alatti-e, ami 1/3 esellyel igaz, ekkor lesz egy ablak sotet. 
          // arra kell figyelni, hogy a j es a k valami tortszammal nojenek mindketten, kulonben az osszeguk tortresze nem fog valtozni
          fill(ablakokSzine2);
        }
        rect(j, k, 7, 20);
      }
    }
  }


  noStroke();
  for (int i=0; i<kraterekSzama; i++) {
    fill(egSzine);
    ellipse(kraterekX[i], kraterekY[i], kraterAtmero, kraterAtmero);
  }

  fill(egitestekSzine);
  for (int i=0; i<csillagokSzama; i++) {
    if (kraterbenVan(csillagokX[i], csillagokY[i])) {
      ellipse(csillagokX[i], csillagokY[i], 3, 3);
    }
  }
  if (robbanasCountdown) {
    if (robbanashelySzamlalo>0) {
      //csinos rajzolas, pont a krater kozepebe
      //a szamlaloval egyutt csokkeno meretben
      float robbanasMeret=kraterAtmero*robbanashelySzamlalo/100;
      image(explosion, kraterekX[kraterekSzama-1]-robbanasMeret/2, kraterekY[kraterekSzama-1]-robbanasMeret/2, robbanasMeret, robbanasMeret);
    } else {
      robbanasCountdown=false;
      robbanashelySzamlalo=120;
    }
    //logikailag nem rajzolas, de itt is lehet valtoztatni a szamlalot
    robbanashelySzamlalo-=1;
  }
}

void preciseAnimate() {
  // ezeket a dolgokat csak akkor erdemes megcsinalni, ha megy a jatek
  if (kiVanLove) {
    moveBanana();


    //ha leesett a banan, akkor mi tortenjen?
    if (bananKintVan() && !kraterbenVan(bananX, bananY)) {
      if (bananHazatEr()) {
        ujKrater(bananX, bananY);
        robbanasCountdown=true;
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
  //banan kirajzolasa
  image(banana, bananX-bananMeret/2, bananY-bananMeret/2, bananMeret, bananMeret);

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

