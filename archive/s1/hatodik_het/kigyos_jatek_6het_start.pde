// ----- április 8. Kedd
//
// ----- RAKJUK RENDBE A KÓD SZERKEZETÉT
// --- Futtasd le mindegyik lépésnél és győződj meg arról, hogy még műkődik.
// 1 - A 255 helyett, vezessük be int FEHER = 255.
// 2 - Cseréld ki az 'm' KOCKA_HOSSZ-ért úgy, hogy Edit -> Find -re kattintsuk.
// 3 - Cseréld ki az 'n' (és 40) a TABLA_HOSSZ-ért.
// 4 - Vezessük be KEZDO_KIGYO_X / Y -t.
// 5 - Vezessük be KEZDO_KIGYO_HOSSZ és KEZDO_FEJIRANYA-t.
// 6 - Vezessük be KEZDO_ALMA_X / Y-t.
// 7 - Tedd át KEZDO_ALMA_X / Y-t a kezdoAllapot() függvénybe.
// 8 - Keresd a varázslatos számokat a saját kódodban és cseréld ki őket konstansokért.
// 9 - Próbáljuk ki úgy, hogy az almát és a kigyot egymáshoz közel tesszük a kezdetben.
//
// ----- LOGIKA
// - Írd meg a noveljKigyot() függvényt (ez csak 1 sor). Nézz utána, hogy miért műkődik ez az egy sor.
// - Írd át a megMindigEl() függvényt valami ilyesmire: return falbaMent() == false && magabaUtkozott() == false;
// - Írd meg a haladAKigyo() függvényt úgy, hogy benne használod a toldElAKigyot függvényt. 
//   És használjuk ezt a függvényt a draw()-ban, hogy magától menjen a kigyó.
// - Legyél büszke magadra!

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
  fejIranya = "right";
  kigyoHossz = 4;

  for (int i = 0; i < kigyoTestX.length; i++) {
    kigyoTestX[i] = -1;
    kigyoTestY[i] = -1;
    kigyoIrany[i] = "right";
  }
  
  for (int i =0; i < kigyoHossz; i++) {
    kigyoTestX[i] = kigyoX-i;
    kigyoTestY[i] = kigyoY;
    kigyoIrany[i] = fejIranya;   
  }
}

void draw () {
  background(255);
  if (megMindigEl()){
      rajzoljTablat();
      rajzoljKigyot();
      rajzoljAlmat();
      if (almaX == kigyoX && almaY == kigyoY) {
        egyelAlmat();
      }
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
  for (int i=0; i < kigyoHossz; i++) {
     rect(kigyoTestX[i] * m, kigyoTestY[i] * m, m, m);
  }
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
    fejIranya = "down";
    kigyoY = kigyoY + 1;
  }
  if (keyCode == RIGHT)
  {
    fejIranya = "right";
    kigyoX = kigyoX + 1;
  }
  if (keyCode == LEFT)
  {
    fejIranya = "left";
    kigyoX = kigyoX - 1;
  }
  if (keyCode == ENTER) {
    kezdoAllapot(); 
  }
  
  toldElAKigyot();
}

void toldElAKigyot(){
  for (int i=kigyoHossz-1; i > 0; i--){
    kigyoTestX[i] = kigyoTestX[i-1];
    kigyoTestY[i] = kigyoTestY[i-1]; 
    kigyoIrany[i] = kigyoIrany[i-1];
  }
  kigyoTestX[0] = kigyoX;
  kigyoTestY[0] = kigyoY;
  kigyoIrany[0] = fejIranya;
}


boolean megMindigEl() {
  if (kigyoX < 0 || kigyoX >= 40 || kigyoY < 0 || kigyoY >= 40 ) {
    return false;
  } else {
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

