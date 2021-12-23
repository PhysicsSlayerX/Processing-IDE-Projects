float[] x = new float[3000];
float x_axis;
float y_axis;
int scalar = 1;

void setup() {
  size(800, 800, P2D);
  smooth();
  fill(255, 200);
  for (int i = 0; i <x.length; i++) {
    x[i] = random(-1000, 200);
  }
  x_axis = width/2;
  y_axis = 0;
}

void draw() {
  background(0);
  translate(x_axis, y_axis);
  pushMatrix();
  for (int i = 0; i < x.length; i++) {
    x[i] += 10*scalar;
    float y = i*0.4;
    arc(x[i], y, 12, 12, 0.52, 5.68);
    stroke(255, 20);
    strokeWeight(1);
    line(0, height/2, x[i], y);
  }
  popMatrix();

  if (x[0] < -width || x[0] > width) {
    scalar = -scalar;
  }
}
