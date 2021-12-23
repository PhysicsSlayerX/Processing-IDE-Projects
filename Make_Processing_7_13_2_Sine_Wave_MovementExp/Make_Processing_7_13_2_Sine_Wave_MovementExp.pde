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
  float y1 = offset + sin(angle)*scalar;
  float y2 = offset + sin(angle + 0.4)*scalar;
  float y3 = offset + sin(angle+0.8)*scalar;
  float y4 = offset + sin(angle+1.2)*scalar;
  float y5 = offset + sin(angle + 1.6)*scalar;
  float y6 = offset + sin(angle+2.0)*scalar;
  ellipse(80, y1, 40, 40);
  ellipse(120, y2, 40, 40);
  ellipse(160, y3, 40, 40);
  ellipse(200, y4, 40, 40);
  ellipse(240, y5, 40, 40);
  ellipse(280, y6, 40, 40);
  angle += speed;
}
