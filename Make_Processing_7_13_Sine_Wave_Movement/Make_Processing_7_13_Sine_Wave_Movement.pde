float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  background(0);
  /*
  float y1 = offset + sin(angle + omega_t)*scalar;
   float y2 = offset + sin(angle + 0.4)*scalar;
   float y3 = offset + sin(angle+0.8)*scalar;
   ellipse(80, y1, 40, 40);
   ellipse(120, y2, 40, 40);
   ellipse(160, y3, 40, 40);
   */

  for (float omega_t = 0; omega_t < 1; omega_t += 0.2) {
    for (float x = 80; x < 250; x += 40) {
      float y = offset + sin(angle + omega_t)*scalar;
      ellipse(x, y, 40, 40);
    }
  }
  angle += speed;
}
