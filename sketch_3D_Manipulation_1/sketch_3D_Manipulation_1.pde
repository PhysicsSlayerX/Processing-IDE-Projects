PImage img;

float x, y, z, xx, yy;
float easing = 0.01;
float x3, y3, z3, rev;

void setup() {
  size(700, 700, P3D);
  x = width/2;
  y = height/2;
  z = 0;
  x3 = width/2;
  y3 = height/2;
  z3 = 0;
  frameRate(60);
  rectMode(CENTER);
  strokeWeight(5);
}

void draw() {
  background(0);
  translate(x, y, z);
  Rect2();
  Rect();
  Ellipse();
  revolvingEllipse();
  
}

void Rect() {
  float targetX = mouseX;
  float targetY = mouseY;
  xx += (targetX-xx)*easing;
  yy += (targetY-yy)*easing;
  if (mouseX <width/2) {
    rotateX(map(xx, 0, width, 0, 50));
    fill(175, 0, 0, 50);
    stroke(255, 0, 0);
  }
  if (mouseX >= width/2) {
    rotateX(map(yy, 0, width, 0, 50));
    fill(0, 0, 175, 50);
    stroke(0, 0, 255);
  }
  if (mouseY < height/2) {
    if (mouseX < width/2) {
      rotateY(map(yy, 0, height, 0, 20));
      fill(0, 175, 0, 50);
      stroke(0, 255, 0);
    } else {
      rotateY(map(yy, 0, width, 0, 20));
      fill(0, 175, 175, 50);
      stroke(0, 255, 255);
    }
  }
  rect(0, 0, 250, 250);
}

void Ellipse() {

  if (mouseX < width/2) {
    rotateX(map(xx, 0, width, 0, 50));
    fill(175, 0, 175, 50);
    stroke(255, 0, 255);
  } else {
    rotateY(map(yy, 0, width, 0, 50));
    fill(0, 0, 175, 50);
    stroke(0, 0, 255);
  }
  if (mouseY < height/2) {
    if (mouseX < width/2) {
      rotateY(map(yy, 0, height, 0, 20));
      fill(0, 175, 0, 50);
      stroke(yy, xx, 0);
    } else {
      rotateY(map(yy, 0, height, 0, 20));
      fill(0, 175, 175, 50);
      stroke(0, yy, xx);
    }
  }
  ellipse(0, 0, 250, 250);
}

void Rect2() {
  translate(x3, y3, z3);
  fill(255, 50);
  stroke(255);
  strokeWeight(5);
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(0);
    }
  } else {
    fill(255);
  }
  if (mousePressed == true) {
    if (mouseButton == CENTER) {
      //rev = rev + (millis()/50 - rev)*easing;
      rev++;
    }
    if (mouseButton == LEFT) {
      x3--;
    }
    if (mouseButton == RIGHT) {
      z3++;
    }
  } else {
    y3 = 0;
    x3 = 0;
    z3 = 0;
  }
  ellipse(150*cos(rev/5), 150*sin(rev/5), 25, 25);
}
void revolvingEllipse() {
  translate(50*cos(rev/10), 50*sin(rev/10), 0);
  ellipse(100+50*cos(rev/10), 100+50*sin(rev/10), 25, 25);
}
