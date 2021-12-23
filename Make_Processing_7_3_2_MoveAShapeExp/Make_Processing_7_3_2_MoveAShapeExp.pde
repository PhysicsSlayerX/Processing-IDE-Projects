int radius = 40;
float x = radius;
float y = radius;
float speedX = 0.5;
float speedY = 1;
float x1, y1, z1;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  ellipseMode(RADIUS);
}
void draw() {
  translate(width/2, height/2);
  //background(0);
  x += speedX; // Increase the value of x
  y += speedY;
  x1 = 150*sin(10*radians(x+1));
  y1 = 150*cos(10*radians(y+2));
  arc(x1, y1, radius, radius, 0.52, 5.76);
}
