
void setup() {
  size(480, 480);
  smooth();
  strokeWeight(30);
}

void draw() {
  background(204);
  stroke(102);
  line(40, 0, 70, height);
  if (mousePressed == true) {
    if (mouseButton == LEFT) {

      stroke(255);
    }
  } else if (mouseButton == CENTER) {
    stroke(255, 0, 0);
  } else {
    stroke(0);
  }
  line(0, 70, width, 50);
}
