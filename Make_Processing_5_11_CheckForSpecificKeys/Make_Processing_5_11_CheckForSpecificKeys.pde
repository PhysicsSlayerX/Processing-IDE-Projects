

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(204);
  translate(width/2, height/2);
  if (keyPressed) {
    if ((key == 'h') || (key == 'H')) {
      line(30, 60, 90, 60);
    }
    if ((key == 'n')|| (key == 'N')) {
      line(30, 20, 90, 100);
    }
    line(30, 20, 30, 100);
    line(90, 20, 90, 100);
  }
}
