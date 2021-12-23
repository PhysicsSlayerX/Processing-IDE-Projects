int x = 20;
int y = 100;
int a = 35;

void setup() {
  size(500, 500);

  //noLoop();
}

void draw() {
  translate(width/4, height/2);
  background(0);
  stroke(255);
  x+=x*sin(radians(x));
  y+=y*cos(radians(y));
  a+=a*sin(radians(a));
  drawT(x, y, a);
}

void drawT(int xpos, int ypos, int apex) {
  line(xpos, ypos, xpos, ypos-apex);
  line(xpos - (apex/2), ypos-apex, xpos+(apex/2), ypos-apex);
}
