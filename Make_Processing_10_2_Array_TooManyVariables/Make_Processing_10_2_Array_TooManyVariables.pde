float x1 = -10;
float x2 = 10;
float x3 = 35;
float x4 = 18;
float x5 = 30;
int scalar = 1;
void setup() {
  size(700, 700);
  smooth();
  noStroke();
}
void draw() {
  background(0);
  x1 += 2*scalar;
  x2 += 2*scalar;
  x3 += 2*scalar;
  x4 += 2*scalar;
  x5 += 2*scalar;
  pushMatrix();
  scale(1,1);
  arc(x1, 20, 20, 20, 0.52, 5.76);
  arc(x2, 40, 20, 20, 0.52, 5.76);
  arc(x3, 60, 20, 20, 0.52, 5.76);
  arc(x4, 80, 20, 20, 0.52, 5.76);
  arc(x5, 100, 20, 20, 0.52, 5.76);
  popMatrix();
  if ((x1 > width && x2 > width && x3 > width && x4 > width && x5 > width) || (x1 < 0 && x2 < 0 && x3 < 0 && x4 < 0 && x5 < 0)) {
    scalar = -scalar;
    
  }
}
