float x, y, z;

void setup() {
  size(400, 400, P3D);
  x = width/2;
  y = height/2;
  z = 0;
  frameRate(60);
  rectMode(CENTER);
  fill(51);
  stroke(255);
}

void draw() {
  background(100);
  translate(x, y, z);
  fill(x,y,z);
  rotateX(map(-mouseX, 0, width, 0, 10));
  rotateY(map(-mouseX, 0, height, 0, 10));
  //rotateZ(PI);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      z = z+1;
      y++;
      x++;
      //rotateZ(z);
    }
    if (mouseButton == RIGHT) {
      z=z-1;
      x--;
      y--;
      //rotateZ(z);
    }
  }
  rect(0, 0, 200, 200);
}
