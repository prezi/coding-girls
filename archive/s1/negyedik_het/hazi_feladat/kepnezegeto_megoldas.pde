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

int hanyadikKep = 0;
PImage[] pics = new PImage[5];
void setup() {
  size(800, 600);

  // illeszd be a kedvenc kepeidet ide
  String[] picLoc = new String[5];
  picLoc[0] = "http://stylonica.com/wp-content/uploads/2014/03/autumn-sunset-hd-wallpaper-nature-landscape-images-autumn-wallpaper.jpg";
  picLoc[1] = "http://sciencefiction.com/wp-content/uploads/2013/12/joss_whedon_buffy_cast.jpg";
  picLoc[2] = "http://cephuscorner.jadedragononline.com/wp-content/uploads/2014/02/Firefly.jpg";
  picLoc[3] = "http://earnthis.net/wp-content/uploads/2014/02/chuck.jpg";
  picLoc[4] = "http://2.bp.blogspot.com/-XhmCLsxta70/TkFd5QUPbXI/AAAAAAAAAB0/CqoADdm-VgE/s1600/AStudyInPink.jpg";

  for (int i = 0; i < picLoc.length; i++) {
    pics[i] = loadImage(picLoc[i]);
  }
}

void draw() {
    drawPicture(hanyadikKep);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
        hanyadikKep = prevIndex(hanyadikKep);
    }
    else if (keyCode == RIGHT) {
        hanyadikKep = nextIndex(hanyadikKep);
    }
  }
}

int nextIndex(int i) {
    i = i + 1;
    if (i >= pics.length){
        i = 0;
    }
    return i;
}

int prevIndex(int i) {
    i = i - 1;
    if (i < 0){
        i = pics.length - 1;
    }
    return i;
}

void drawPicture(int i) {
    image(pics[i],0,0, width, height);
}

