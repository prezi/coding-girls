void setup() {
  size(400,400);
  background(0,0,255);
}

void draw() {
  if(mouseX < width / 2 && mouseY < height / 2) {
    background(255,0,0);
  }
  if(mouseX < width / 2 && mouseY > height / 2) {
    background(0,255,0);
  }
  if(mouseX > width / 2 && mouseY < height / 2) {
    background(0,0,255);
  }
  if(mouseX > width / 2 && mouseY > height / 2) {
    background(255,255,0);
  }
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}
