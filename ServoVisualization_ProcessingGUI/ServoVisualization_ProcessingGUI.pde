
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;
float x, y, z;


void setup() {
  size(700, 700, P3D);
  frameRate(120);
  smooth();
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  background(204);
  translate(x, y, z);
  perspective3D();
  oneLeg();
  reversedLeg();


  angle += speed*angleDirection;
  if ((angle > QUARTER_PI)||(angle<0)) {
    angleDirection *= -1;
  }
}

void oneLeg() {
  pushMatrix();
  translate(20, 20);
  rotate(angle);
  strokeWeight(12);
  line(0, 0, 125, 0);
  translate(125, 0);
  rotate(angle*2.0);
  strokeWeight(6);
  line(0, 0, 100, 0);
  translate(100, 0);
  rotate(angle*2.5);
  strokeWeight(3);
  line(0, 0, 50, 0);
  popMatrix();
}

void reversedLeg() {
  pushMatrix();
  scale(-1, 1);
  oneLeg();
  popMatrix();
}

void perspective3D() {
  if (mousePressed) {
    if (mouseButton == LEFT) {
      rotateX(radians(map(mouseX, -width/2, width/2, 0, 180 )));
      rotateY(radians(map(mouseY, -width/2, width/2, 0, 180)));
    }
    if (mouseButton == RIGHT) {
      rotateX(radians(map(mouseX, -width/2, width/2, 180, 0)));
      rotateY(radians(map(mouseY, -width/2, width/2, 180, 0)));
    }
  }
}
