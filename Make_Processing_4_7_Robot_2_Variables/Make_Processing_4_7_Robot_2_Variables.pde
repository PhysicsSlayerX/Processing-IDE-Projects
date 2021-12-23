int x = 180;
int y = 420;
int bodyHeight = 110;
int neckHeight = 140;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;
int COUNTER = 0;


void setup() {
  size(480, 480);
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
  frameRate(120);
}


void draw() {
  background(255);
  x++;
  //y--;
  Neck();
  Antennae();
  Body();
  Head();
  if (x >= width+100) {
    x = -100;
  }
}

void Neck() {
  stroke(102);
  line(x+2, y-bodyHeight+ 50*sin(x/10), x+2, ny);
  line(x+12, y-bodyHeight+ 50*sin(x/10), x+12, ny);
  line(x+22, y-bodyHeight+ 50*sin(x/10), x+22, ny);
}

void Antennae() {
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
}

void Body() {
  noStroke();
  fill(102);
  ellipse(x, y-33 + 50*sin(x/10), 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight + 50*sin(x/10), 90, bodyHeight -33);
  fill(102);
  rect(x-45, y-bodyHeight+17 + 50*sin(x/10), 90, 6);
}

void Head() {
  fill(0);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(153);
  ellipse((x+24)+2*cos(x/10), (ny-6)+2*sin(x/10), 3, 3);
  fill(153);
  ellipse(x, ny-8, 5, 5);
  ellipse(x+30, ny-26, 4, 4);
  ellipse(x+41, ny+6, 3, 3);
}
