//import processing.opengl.*;
snow[] snowfield = new snow[7000];
float speed;

void setup() {
  fullScreen(P2D);
  //size(1920,1080,P2D);
  speed = 1.0;
  for (int i = 0; i < snowfield.length; i++) {
    snowfield[i] = new snow();
  }
}
void draw() {
  translate(width/2, height/2);
  background(20);
  for (int i = 0; i < snowfield.length; i++) {
    snowfield[i].update();
    snowfield[i].display();
  }
}
