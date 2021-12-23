float angle = 0.0;
float offset = 349;
float offset2 = 255;
float scalar = 2;
float speed = 0.05;


void setup() {
  size(700, 700);
  background(0);
  fill(0);
  smooth();
  noStroke();
}

void draw() {
  float x = offset - cos(angle)*scalar;
  float y = offset + sin(angle)*scalar;
  fill(255);
  ellipse(x, y, 2, 2);
  float x1 = offset2 + cos(angle)*scalar;
  float y1 = offset2 + sin(angle)*scalar;
  fill(255);
  ellipse(x1, y1, 2, 2);
  angle+=speed;
  scalar+=speed;
}
