JitterBug bug1, bug2, bug3;
StarBug1 starBug;
moveBasic sampleBug, sB2;

void setup() {
  size(700, 700);
  //fullScreen1();
  smooth();
  //background(0);
  for (int i = 0; i < 40; i+=2) {
    bug1 = new JitterBug(width/2, height/2, i, i, 255);
    bug2 = new JitterBug(width/2, height/2, i, i*2, 255);
    bug3 = new JitterBug(width/2, height/2, i, i*3, 255);
    //starBug = new StarBug1(50, 50, 50, 1, 10, 50, 50, 2);
  }
  sampleBug = new moveBasic(100, 100, 50, 3);
  sB2 = new moveBasic(150,150, 50, 6);
}

void draw() {
  background(0);
  bugFunction();
  translate(width/2, height/2);
  //starBug.starMove();
  //starBug.starDisplay();
  sampleBug.move();
  sampleBug.display();
  sB2.move();
  sB2.display();
}

void bugFunction() {
  bug1.move();
  bug2.move();
  bug3.move();
  bug1.display();
  bug2.display();
  bug3.display();
}

class JitterBug {
  float x;
  float y;
  int colorValue;
  int diameter;
  float speed;

  JitterBug(float tempX, float tempY, int tempDiameter, float tempSpeed, int tempColorValue) {
    x = tempX;
    y = tempY;
    colorValue = tempColorValue;
    diameter = tempDiameter;
    speed = tempSpeed;
  }
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }

  void display() {
    float colorRandom = random(180, colorValue);
    fill(random(colorRandom), random(colorRandom));
    stroke(random(colorRandom), random(colorRandom));
    ellipse(x, y, cos(diameter), sin(diameter));
  }
}
