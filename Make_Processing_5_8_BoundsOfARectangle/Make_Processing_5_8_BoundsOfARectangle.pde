int x = 399-200/2;
int y = 399-200/2;
int w = 200;
int h = 200;

void setup() {
  size(800, 800);
  //rectMode(CENTER);
}

void draw() {
  background(204);
  if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) {
    fill(0);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
}
