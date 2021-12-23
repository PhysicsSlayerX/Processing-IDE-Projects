int x = 0; // X-coordinate
int r = 285; // Starting radius
int n = 6; // Number of recursions
void setup() {
  size(700, 700);
  noStroke();
  smooth();
  noLoop();
}
void draw() {
  translate(width/2, height/2);
  drawCircle(x, r, n);
}
void drawCircle(int x, int radius, int num) {
  float tt = 126 * num/4.0;
  fill(tt);
  ellipse(x,0, radius*2, radius*2);
  if (num > 1) {
    num = num - 1;
    drawCircle(x - radius/2, radius/2, num);
    drawCircle(x + radius/2, radius/2, num);
  }
}
