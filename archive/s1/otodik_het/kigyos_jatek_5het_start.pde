int m = 15;
int n = 40;

int almaX;
int almaY;

int kigyoX;
int kigyoY;
String fejIranya;

int kigyoHossz;

int[] kigyoTestX = new int[1600];
int[] kigyoTestY = new int[1600];
String[] kigyoIrany = new String[1600];
 
// boolean jatszunk; // ha meghal a kigyo, akkor ne menjen a jatek, amig a jatekos ETER-rel ujra nem inditja

void setup () {
  size(601, 601);
  frameRate(4);
  almaX = 35;
  almaY = 20;
  kezdoAllapot();
}

void kezdoAllapot() {
  kigyoX = 10;
  kigyoY = 20;
  fejIranya = "rigth";
  kigyoHossz = 4;

  for (int i = 0; i < kigyoTestX.length; i++) {
    kigyoTestX[i] = -1;
    kigyoTestY[i] = -1;
    kigyoIrany[i] = "right";
  }
  kigyoTestX[0] = kigyoX;
  kigyoTestY[0] = kigyoY;
  kigyoIrany[0] = fejIranya;
}

void draw () {
  background (255);
  rajzoljTablat();
  rajzoljKigyot();
  rajzoljAlmat();
  if (almaX == kigyoX && almaY == kigyoY) {
    egyelAlmat();
  }
}


void rajzoljTablat () {
  for (int i = 0; i < width; i = i+m) {
    line (i, 0, i, height);
    line (0, i, width, i);
  }
}

void rajzoljKigyot() {
  fill(0, 255, 0);
  rect(kigyoX * m, kigyoY * m, m, m);  
}

void rajzoljAlmat() {
  fill(255, 0, 0);
  rect(almaX * m, almaY * m, m, m);
}


void keyPressed() {
  if (keyCode == UP)
  {
    fejIranya = "up";
    kigyoY = kigyoY - 1;
  }
  if (keyCode == DOWN)
  {
    kigyoY = kigyoY + 1;
  }
  if (keyCode == RIGHT)
  {
    kigyoX = kigyoX + 1;
  }
  if (keyCode == LEFT)
  {
    kigyoX = kigyoX - 1;
  }
  if (keyCode == ENTER) {
    kezdoAllapot(); 
  }
}

boolean megMindigEl() {
  if (kigyoX < 0 || kigyoX >= 40 || kigyoY < 0 || kigyoY >= 40 ) {
    return false;
  } else {
    // ellenorizzuk, hogy a kigyo magaba utkozik-e
    return true;
  }
}

void egyelAlmat() {
  almaX = int(random(1, 40));
  almaY = int(random(1, 40));
  kigyotNovel();
}

void kigyotNovel() {
  
}

