int time1 = 2000;
int time2 = 4000;
int time3 = 12000;
float x = 0;
boolean STATE = true;

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  int currentTime = millis();
  background(204);
  if (currentTime > time2 && STATE == true) {
    x -= 1;
  } else if (currentTime > time1) {
    x+=3;
  }
  if (x == 200) {
    STATE = false;
  }
  ellipse(x, 60, 90, 90);
}
