float angle = 0.0;
float offset = 349;
float scalar = 2;
float speed = 0.05;


void setup() {
  size(700, 700);
  fill(0);
  smooth();
}

void draw() {
  float x = offset + cos(angle)*scalar;
  float y = offset + sin(angle)*scalar;
  ellipse(x, y, 2, 2);
  angle+=speed;
  scalar+=speed;
}
