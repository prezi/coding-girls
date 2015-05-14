/*
  A kedvenc kepeinket szeretnenk nezegetni.
  
  a)
  Ha a jobbra gombot nyomjuk, akkor a kovetkezo kep jelenjen meg, ha a balra gombot nyomjuk, akkor ugorjon az elozore.
  Ha a legelso kepen allva nyomjuk a balra gombot, akkor az utolso kep jelenjen meg.
  Hasonloan, ha az utolso kepen allva nyomjuk meg a jobbra gombot, akkor az elso kepre ugorjunk.

  Hasznald a megadott fuggvenyeket (keyPressed, nextIndex, prevIndex, drawPicture)
  
  b) 
  Az epp megjeleno kep soha ne logjon ki a vaszonrol (azaz ha nagyobb lenne a kep, meretezzuk at (arányosan))
*/

int j = 0;
PImage[] pics = new PImage[5];
void setup() {
  size(800, 600);

  // illeszd be a kedvenc kepeidet ide
  String[] picLoc = new String[5];
  picLoc[0] = "http://ia.media-imdb.com/images/M/MV5BMTQ4MDc0Mjg4OV5BMl5BanBnXkFtZTgwODk3NjYyMTE@._V1_SY1200_CR90,0,630,1200_.jpg";
  picLoc[1] = "http://sciencefiction.com/wp-content/uploads/2013/12/joss_whedon_buffy_cast.jpg";
  picLoc[2] = "http://cephuscorner.jadedragononline.com/wp-content/uploads/2014/02/Firefly.jpg";
  picLoc[3] = "http://earnthis.net/wp-content/uploads/2014/02/chuck.jpg";
  picLoc[4] = "http://2.bp.blogspot.com/-XhmCLsxta70/TkFd5QUPbXI/AAAAAAAAAB0/CqoADdm-VgE/s1600/AStudyInPink.jpg";

  for (int i = 0; i < picLoc.length; i++) {
    pics[i] = loadImage(picLoc[i]);
  }
}

void draw() {
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      // elozo kep
    } 
    else if (keyCode == RIGHT) {
      //kovetkezo kep
    }
  }
}

int nextIndex(int i) {
}

int prevIndex(int i) {
}

void drawPicture(int indexOfPicture) {
 
}

