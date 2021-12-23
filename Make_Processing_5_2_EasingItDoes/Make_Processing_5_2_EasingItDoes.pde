float x;
float y;
float easing = 0.05;
float diameter = 12;

void setup() {
  size(480, 480);
  smooth();
  //strokeWeight(4);
}

void draw() {
  //background(102);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x)*easing;
  y += (targetY - y)*easing;
  ellipse(x,y,diameter,diameter);
  print(targetX + ":" +x);
}

//each trip through draw is a frame.
//default: 60 frames per second.
//pmouseX and pmouseY
