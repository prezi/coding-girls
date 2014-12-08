
float madarX;
float madarY;
float madarSebesseg;
float madarMeret;

int OSZLOPOK_SZAMA = 3;
float oszlopok[] = new float[OSZLOPOK_SZAMA];
float oszlopResek[] = new float[OSZLOPOK_SZAMA];
float oszlopSebesseg = 5;
float oszlopSzelesseg = 50;

float GRAVITACIO = 0.3;
float UGRAS_SEBESSEG = 5;

boolean gameOver = false;
int pontSzam = 0;

void setup() {
  size(800, 600);
  
  madarX = 50;
  madarY = height/4;
  madarSebesseg = 0;
  madarMeret = 50;
  
  for(int i = 0; i < oszlopok.length; ++i) {
    oszlopok[i] = width + i * (width/OSZLOPOK_SZAMA);
    oszlopResek[i] = random(height/4, height/2);
  }
}

void draw() {
  background(#FFFFFF);
  if (!gameOver) {
    madarRajzol();
    madarFrissit();
    oszlopRajzol();
    oszlopFrissit();
  } else {
    jatekVege();
  }
}

void madarRajzol() {
  fill(#00FFFF);
  ellipse(madarX, madarY, madarMeret, madarMeret);
}

void madarFrissit() {
  madarY += madarSebesseg;
  madarSebesseg += GRAVITACIO;
  if(utkozes()) {
    gameOver = true;
  }
}

void oszlopRajzol() {
  for(int i = 0; i < oszlopok.length; ++i) {
    noStroke();
    fill(#FFFF00);
    rect(oszlopok[i], 0, oszlopSzelesseg, oszlopResek[i]);
    rect(oszlopok[i], oszlopResek[i] + height/4, oszlopSzelesseg, height);
  }
}

void oszlopFrissit() {
  for(int i = 0; i < oszlopok.length; ++i) {
    oszlopok[i] -= oszlopSebesseg;
    if (oszlopok[i] < -oszlopSzelesseg) {
      pontSzam += 1;
      oszlopok[i] = width;
    }
  }
}

void jatekVege() {
  fill(#000000);
  textSize(72);
  textAlign(CENTER);
  text(pontSzam, width/2, height/2);
}

boolean utkozes() {
  boolean felsoUtkozes = false;
  boolean alsoUtkozes = false;
  
  for(int i = 0; i < oszlopok.length; ++i) {
    boolean madarOszlopbanX = madarX + madarMeret/2 > oszlopok[i] &&
                              madarX < oszlopok[i] + oszlopSzelesseg;
    
    if (madarOszlopbanX) {
      int melyikOszlop = i;
      felsoUtkozes = madarY < oszlopResek[melyikOszlop];
      alsoUtkozes = madarY + madarMeret/2 > oszlopResek[melyikOszlop] + height/4;
    }
  }
  
  return felsoUtkozes || alsoUtkozes;
}

void keyPressed() {
  if (key == ' ') {
    madarSebesseg = -UGRAS_SEBESSEG;
  }
}
