

void setup() {
  size(800, 800);
  smooth();
  //rectMode(CENTER);
}

void draw() {
  background(204);
  line(20, 20, width-20, height-20);
  if (keyPressed) {
    line(width-20, 20, 20, height-20);
  }
}
