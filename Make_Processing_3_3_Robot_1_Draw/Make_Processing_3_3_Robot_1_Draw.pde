float x = 0;
float y = 0;

void setup() {
  size(720, 480);
  frameRate(30);
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
}

void draw() {
  background(255, mouseX, mouseY);
  Neck();
  antennae();
  Body();
  Head();
  lines();
  boomShape();
}


void Neck() {
  stroke(102);
  x = x + 1;
  line(266, 257-x, 266, 162);
  line(276, 257-2*x, 276, 162);
  line(286, 257-3*x, 286, 162);
  while (x == 20) {
    x = x - 5;
  }
}
void antennae() {
  x++;
  y = y + 1;
  line(276, 155, 246+x, 112-x);
  line(276, 155, 306-x, 56+x);
  line(276, 155, 342+x, 170-x);
  while (x == 6) {
    x = x - 5;
  }
}

void Body() {
  x++;
  noStroke();
  fill(102);
  ellipse(264-x/10, 377, 33, 33);

  fill(0);
  rect(219, 257+x/10, 90, 120);
  fill(102);
  rect(219, 274+x/10, 90, 6);
  //fill(100, 0,0);
  //quad(250, 300, 270, 300, 250-x, 400-x, 200+x, 350+x );
  fill(255-x*2, 255-x*5, 255-x*5);
  quad(270-x/10, 300-x/10, 300+x/10, 300-x/10, 300+x/10, 325+x/10, 270-x/10, 325+x/10);
  while (x == 3) {
    x = x-2;
  }
}

void Head() {
  x = x + 1/10;
  y = y + 1/10;
  fill(0);
  ellipse(276, 155, 45, 45);
  fill(255, 255-x*4, 255-x*4);
  ellipse(288+ 3*sin(x), 150+4*cos(y), 14, 14);
  fill(0);
  ellipse(288+3*cos(x), 150+3*sin(y), 3, 3);
  while (x == 20) {
    x = 0;
    y = 0;
  }
  fill(153);
  ellipse(263, 148, 5, 5);
  ellipse(296, 130, 4, 4);
  ellipse(305, 162, 3, 3);
}

void lines() {
  stroke(10);
  line(100-x*10, 300, 200-x*7, 300);
  line(600-x*5, 350, 720-x*5, 350);
  line(450-x*5, 370, 500-x*5, 370);
}

void boomShape() {
  if (mousePressed) {
    y++;
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, y*2, y*2);
    if (y == 200) {
      y = y - 2;
    }
  }
}
