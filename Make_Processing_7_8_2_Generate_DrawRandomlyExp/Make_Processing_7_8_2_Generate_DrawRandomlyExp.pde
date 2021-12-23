void setup () {
  size(700, 700);
  smooth();
}
void draw() {
  background(204);
  for (int x = 20; x < width; x += 40) {
    for (int y = 20; y < height; y += 40) {
      float my = mouseY/10;
      float mx = mouseX/10;
      float offsetA = random(-mx, mx);
      float offsetB = random(-mx, mx);
      float offsetAy = random(-my, my);
      float offsetBy = random(-my, my);
      line(x+offsetA, 20, x - offsetB, 680);
      line(20, y+offsetAy, 680 , y - offsetBy);
    }
  }
}
