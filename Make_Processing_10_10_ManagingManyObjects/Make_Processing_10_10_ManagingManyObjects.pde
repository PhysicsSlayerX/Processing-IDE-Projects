JitterBug[] bugs = new JitterBug[330];

void setup() {
  size(700, 700, P2D);
  frameRate(120);
  smooth();

  for (int i = 0; i < bugs.length; i++) {
    float x = random(width);
    float y = random(height);
    float r = random(i)/100+ 2;
    bugs[i] = new JitterBug(x, y, r);
  }
}

void draw() {
  //background(0);

  for (int i = 0; i < bugs.length; i++) {
    bugs[i].move();
    bugs[i].display();
  }

}

class JitterBug {
  float x;
  float y;
  float diameter;
  float speed = 5;
  JitterBug(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
