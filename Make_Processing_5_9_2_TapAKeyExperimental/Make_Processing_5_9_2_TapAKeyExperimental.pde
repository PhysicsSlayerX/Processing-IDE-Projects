
float easing = 0.1;


void setup() {
  size(800, 800);
  smooth();
  stroke(0);
  //rectMode(CENTER);
}

void draw() {
  //background(204);
  translate(width/2, height/2);
  float inc = millis();
  line(20-width, 20-height, width-20, height-20);
  if (keyPressed) {
    fill(255, 0, 0, 50);
    float movement = inc;
    inc += (movement - inc)*easing;
    ellipse(400*sin(sin(sin((radians(inc/10))))), 400*cos(radians(inc/100)), 20, 20);
    line(width-20, 20-width, 20-height, height-20);
  }
}
