int m = 15;
int n = 40;
int kigyoX =10;
int kigyoY =20;


void setup () {
  size(601, 601);
}


void draw (){
   background (255);
  rajzoljTablat ();
  rajzoljKigyot(kigyoX, kigyoY);
  rajzoljAlmat();
 
}

void rajzoljTablat () {
  for (int i = 0; i < width; i = i+m) {
    line (i, 0, i, height);
    line (0, i, width, i);
  }
}

void rajzoljKigyot(int X, int Y) {

  fill(0, 255, 0);
  rect(X * m, Y * m, m, m);
  //PImage kigyoKep = loadImage("kigyoKep.png");
  //image(kigyoKep, X * m, Y * m, m, m);
  
  
}

void rajzoljAlmat(){
 int almaX = 35;
  int almaY = 20;
 
 fill(255, 0,0);
  rect(almaX * m, almaY * m, m, m); 
}


void keyPressed(){
if (keyCode == UP)
{
 kigyoY = kigyoY - 1; 
}
  
}


