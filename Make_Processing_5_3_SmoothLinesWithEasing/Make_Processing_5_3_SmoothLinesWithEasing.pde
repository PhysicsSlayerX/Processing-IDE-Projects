float x; //current x
float y; //current y
float px; //previous x
float py; //previous y
float easing = 0.05;

void setup() {
  size(480, 480);
  smooth();
  stroke(0);
}

void draw() {
  background(102);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x)*easing;
  y += (targetY - y)*easing;
  float weight = dist(x,y,px,py); //calculates distance between two points.
  strokeWeight(weight);
  line(x,y,px,py);
  py=y;
  px=x;
  
}

//each trip through draw is a frame.
//default: 60 frames per second.
//pmouseX and pmouseY
