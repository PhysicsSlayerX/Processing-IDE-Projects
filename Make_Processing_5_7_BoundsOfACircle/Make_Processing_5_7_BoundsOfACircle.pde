int x;
int y;
int radius = 12;

void setup() {
  size(700, 700);
  smooth();
  x = width/2;
  y = height/2;
  ellipseMode(RADIUS);
}

void draw() {
  background(204);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius++;
    fill(0);
  } else if (d > radius && d <= radius*2) {
    fill(120);
    radius--;
  } else {
    fill(255);
  }

  ellipse(x, y, radius, radius);
}
