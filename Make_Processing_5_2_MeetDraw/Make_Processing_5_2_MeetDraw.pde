int x = 280;
int y = -100;
int diameter = 9;

void setup() {
  size(480, 480);
  smooth();
  fill(0, 102);
  stroke(0, 102);
  strokeWeight(4);
}

void draw() {
  //background(204);
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

//each trip through draw is a frame.
//default: 60 frames per second.
//pmouseX and pmouseY
