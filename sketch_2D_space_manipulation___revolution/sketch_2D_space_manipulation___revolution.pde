float x, y, z, rev,rot_z,xx,yy;
float easing = 0.01;

void setup() {
  size(1000, 500, P3D);
  frameRate(120);
  smooth();
  noStroke();
  x = width/2;
  y = height/2;
  z = 0;
  rev = 0;
  rot_z =0;
  background(0);
}

void draw() {
  rev++;
  translate(x+30*cos(rev/10), y+30*sin(rev/10), rot_z);
  /*
  float targetX = mouseX;
  float targetY = mouseY;
  xx += (targetX-xx)*easing;
  yy += (targetY-yy)*easing;
  rotateX(map(xx, 0, width, 0, 50));
  rotateX(map(yy, 0, width, 0, 50));
  */
  fill(255,150*cos(rev/100), 0,50);
  ellipse(100*cos(rev/13), 100*sin(rev/13), 7, 7);
  fill(0, 255, 100*sin(rev/13),50);
  ellipse(150*sin(rev/100), 150*cos(rev/100), 6, 6);
  fill(250*cos(rev/20), 270*sin(rev/37), 300*cos(rev/50), 50);
  ellipse(200*cos(rev/7), 200*sin(rev/27), 5, 5);
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      rot_z += 10;
    }
    if (mouseButton == RIGHT) {
      rot_z -= 10;
    }
  }
}
