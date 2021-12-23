float x = 60;
float y = 440;
int radius = 45;
int bodyHeight = 160;
int neckHeight = 70;
float ny = y - bodyHeight - neckHeight - radius;
boolean redState = true;
//int lastState = 0;

float easing = 0.02;

void setup() {
  size(800, 800);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
void draw() {
  background(204);
  int targetX = mouseX;
  //int targetY = mouseY;
  x += (targetX - x) * easing;
  //y +=(targetY - y)*easing;
  if ((mouseX > width/2 && x < width/2+200)|| mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
    fill(255,0,0);
  } else {
    neckHeight = 70;
    bodyHeight = 160;
    fill(255);
  }
  rect(width/2,height/6,200,200);
  Neck();
  Antennae();
  Body();
  Head();
}

void Neck() {
  float ny = y - bodyHeight - neckHeight - radius;
  stroke(102);
  line(x+12, y-bodyHeight, x+12, ny);
}
void Antennae() {
  // Antennae
  float ny = y - bodyHeight - neckHeight - radius;
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
}
void Body() {
  float ny = y - bodyHeight - neckHeight - radius;
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
}
void Head() {
  float ny = y - bodyHeight - neckHeight - radius;
  fill(0);

  ellipse(x+12, ny, radius, radius);
  if (redState == true) {
    fill(255);
  }
  if (redState == false) {
    fill(255, 0, 0);
  }
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      redState = false;
    }
    if (key == 't' || key == 'T') {
      redState = true;
    }
  }

  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
}
