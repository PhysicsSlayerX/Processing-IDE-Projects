int radius = 40;
float x = -radius;
float speed = 0.5;

void setup() {
  size(500, 500);
  smooth();
  ellipseMode(RADIUS);
}
void draw() {
  background(0);
  x += speed; // Increase the value of x
  arc(x, 60, radius, radius, 0.52, 5.76);
}
