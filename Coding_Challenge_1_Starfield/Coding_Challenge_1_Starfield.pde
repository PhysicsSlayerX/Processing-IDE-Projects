import processing.opengl.*;

Star[] stars = new Star[10000];
float speed;
void setup() {
  fullScreen(P2D);
  //size(700, 700, OPENGL);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {

  /*if (mouseX > width/2) {
    speed = map(mouseX, width/2, width, 5, 0);
  }
  if (mouseX < width/2) {
    speed = map(mouseX, 0, width/2, 0, 5);
  }*/
  speed = 5;
  background(0);
  translate(width/2, height/2);
  scale(0.35);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
