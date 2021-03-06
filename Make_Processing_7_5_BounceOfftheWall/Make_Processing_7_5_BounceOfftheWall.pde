int radius = 40;
float x = 110;
float speed = 1.5;
int direction = 1;

void setup () {
  size(240, 120);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  x += speed * direction;
  if ((x > width-radius)|| (x < radius)) {
    direction = -direction;
  }
  if (direction == 1) {
    arc(x, 60, radius, radius, 0.52, 5.76);
  } else {
    arc(x, 60, radius, radius, 3.67, 8.9);
  }
}
