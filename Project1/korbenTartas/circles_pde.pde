float bigX;
float bigY;
int bigRadius;

float targetX;
float targetY;
int steps;

float distX;
float distY;

float smallX;
float smallY;
int smallRadius;

float randomX;
float randomY;

int clr;

int difficulty;
int smallLag;

int points;
int frameCounter;

PFont text;

void setup() {
  size(800, 600);

  bigX = width/2;
  bigY = height/2;
  bigRadius = 100;

  targetX = bigX;
  targetY = bigY;

  smallRadius = 30;

  randomX = random(0, width);
  randomY = random(0, height);

  clr = 255;

  difficulty = 120;
  steps = difficulty;
  smallLag = 16;

  text = createFont("Arial", 16, true);

  points = 0;
  frameCounter = 1;
}

void draw() {
  if (clr > 0) { //if the color of the big circle is not red yet, the game is ON!
    background(#FFFFFF);

    frameCounter++;
    if (frameCounter == 60) {
      points++;
      frameCounter = 1;
    }

    textFont(text, 50);
    fill(30, 190, 57); //green
    text(points, 20, 50);


    if (isInTarget() && clr < 255) {
      clr++;
    } else if ( clr > 0) {
      clr--;
    }

    drawBig();
    drawSmall();
    
  } else { //game over  
    background(#FFFFFF);

    textFont(text, 80);
    fill(90, 60, 90); //purple
    text("Game over! :(", 100, 100);

    textFont(text, 50);
    fill(30, 190, 57); //green
    text("Your final score is: " + points, 130, 200);
  }
}

void drawBig() {
  if (steps == difficulty) { // choose a new target
    targetX = random(width/8, width - width/8);
    targetY = random(height/8, height - height/8);
    steps = 1;

    distX = (targetX - bigX)/difficulty;
    distY = (targetY - bigY)/difficulty;
  }

  //take a step towards the target
  bigX += distX;
  bigY += distY;

  fill(255-clr, clr, 0);
  ellipse(bigX, bigY, bigRadius, bigRadius);
  steps++;
}

void drawSmall() {
  //folows the mouse with a lag, jus like in the example
  smallX += (mouseX - smallX)/smallLag;
  smallY += (mouseY - smallY)/smallLag;
  fill(0, 0, 90);
  ellipse(smallX, smallY, smallRadius, smallRadius);
}

boolean isInTarget() {
  //pythagoras...
  float dist = sqrt(sq(bigX - smallX) + sq(bigY - smallY));
  boolean in = false;
  if (dist < bigRadius/2 - smallRadius/2) {
    in = true;
  }

  return in;
}

