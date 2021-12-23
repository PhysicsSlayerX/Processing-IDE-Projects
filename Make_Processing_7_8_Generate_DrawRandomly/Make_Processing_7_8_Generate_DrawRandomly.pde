void setup () {
  size(700, 700);
  smooth();
}
void draw() {
  background(204);
  for (int x =20; x < width; x += 20) {
    float mx = mouseX/10;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    line(x+offsetA, 20, x - offsetB, 600);
  }
}
