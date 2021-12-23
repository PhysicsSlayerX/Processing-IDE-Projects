float x, y, z, x1, y1, z1, inc, inc2, inc3;

void setup() {
  size(900, 900, P3D);
  noFill();
  smooth();
  x = width/2;
  y = height/2;
  z = -width/2;
  //stroke(255);
}
void draw() {
  background(0);
  inc3++;
  translate(x, y, z);
  rotateX(radians(inc3));
  circle1();
}

void circle1() {
  float[] coswave = new float[width];

  for (int i = 0; i < width; i++) {
    float amount = map(i, 0, width, 0, PI);
    coswave[i] = abs(cos(amount));
  }
  inc++;
  inc2 = 100*sin(radians(inc*8));
  for (int i = 0; i < width/2; i+=50) {
    for (float j = 0; j < height/2; j+=100) {
      pushMatrix();
      translate(0,0, z+j+inc2);
      stroke(255*coswave[i],150*coswave[i], 75*coswave[i]);
      ellipse(0, 0,i+inc2,i+inc2);
      popMatrix();
    }
  }
}
