
boolean a1 = true;
boolean a2 = true;
boolean a3 = true;
boolean a4 = true;
boolean a5 = true;
boolean a6 = true;
boolean a7 = true;


void setup() {
  size(480, 480);
  smooth();
  strokeWeight(30);
}

void draw() {
  background(204);
  stroke(10);
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      if (a7 == false) {
        ellipse(239, 239, 100, 100);
      } else if (a3 == false) {
        line(10, 10, 400, 400);
      } else {
        rect(50, 50, 100, 100);
      }
    } else if (mouseButton == CENTER) {
      if (a4 == false) {
        quad(20, 20, 300, 20, 300, 300, 20, 300);
      } else if (a5 == false) {
        arc(250, 250, 100, 100, 0, PI);
      } else {
        strokeWeight(100);
        line(20, 300, 400, 20);
      }
    } else {
      if (a6 == true) {
        background(255, 0, 0);
      }
    }
  }
}
