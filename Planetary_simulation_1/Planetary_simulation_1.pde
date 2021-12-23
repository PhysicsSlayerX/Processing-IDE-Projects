float x, y, z, x1, y1, z1, rev, rotX, rotY, rotZ, x3,y3,z3;
float xx, yy, px, py, x2, y2, z2, rev2, rev3, rev4, rev5;
float easing = 0.01;
int colorRGB;

void setup() {
  size(1920, 1080, P3D);
  frameRate(240);
  smooth();
  x = width/2;
  y = height/2;
  z = 0;
  x1 = 0;
  y1 = 0;
  z1 = 0;
  x2 = 0;
  y2 = 0;
  z2 = 0;
  x3 = 0;
  y3 = 0;
  z3 = 0;
  strokeWeight(1);
  stroke(40);
  background(150);
}

void draw() {
  //background(100);
  translate(x, y, z);
  /*if (mousePressed) {
    rotateX(radians(map(mouseX, 0, width, 0, 360)));
    rotateY(radians(map(mouseX, 0, width, 0, 360)));
  }*/
  rotX++;
  rotY++;
  rotateX(sin(radians(rotX/10)));
  rotateY(cos(radians(rotY/10)));
  println(frameCount);
  Sun();
  randomObject();
  Mercury();
  MercuryMoon();
  Venus();
  VenusMoon();
}

void Sun() {
  colorRGB++;
  fill(random(colorRGB), random(colorRGB), random(colorRGB));
  ellipse(0, 0, 100, 100);
}
void randomObject() {
  rev += 10*random(sin(cos(rev)));
  //rev++;
  float targetX = 300*sin(radians(rev));
  float targetY = 300*cos(radians(rev));
  xx += (targetX - xx)*easing;
  yy += (targetY - yy)*easing;
  fill(255, 90);
  float weight = dist(px, py, xx, yy);
  ellipse(xx, yy, weight/25, weight/25);
  //line(xx,yy,px,py);
}
void Mercury() {
  translate(x2, y2, z2);
  rev2++;
  fill(155, 155, 120,70);
  ellipse(350*sin(radians(rev2/4)), 350*cos(radians(rev2/4)), 10, 10);
}
void MercuryMoon() {
  rev3++;
  translate(350*sin(radians(rev3/4)), 350*cos(radians(rev3/4)), z2);
  fill(255, 0, 0,70);
  ellipse(50*sin(radians(rev3*2)), 50*cos(radians(rev3*2)), 7, 7);
}

void Venus() {
  translate(x3-350*sin(radians(rev3/4)),y3-350*cos(radians(rev3/4)), z3);
  rev4++;
  fill(250, 155, 78, 70);
  ellipse(350*sin(radians(rev4/10)), 350*cos(radians(rev4/10)), 10, 10);
}
void VenusMoon() {
  rev5++;
  translate(350*sin(radians(rev5/10)), 350*cos(radians(rev5/10)), z3);
  fill(255, 255, 0, 70);
  ellipse(50*sin(radians(rev3)), 50*cos(radians(rev3)), 7, 7);
}
