int num = 1000;
int x[] = new int[num];
int y[] = new int[num];
float easing = 0.005;
float diameter = 20;
float angle;
void setup() {
  size(700, 700, P2D);
  frameRate(120);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  angle++;
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  float targetX = random(0, 2*width*sin(radians(angle))+width);
  float targetY = random(0, 2*height*sin(radians(angle))+height);
  x[0] += 1*(targetX - x[0])*easing;
  y[0] += 1*(targetY - y[0])*easing;
  for (int i = 0; i <x.length; i++) {
    fill(i*4, i*sin(radians(i)), i*cos(radians(i)), i*sin(radians(i)));
    ellipse(x[i], y[i], x[i]/150, x[i]/150);
  }
  /*for (int i = x.length-1; i > 0; i--) { //Normal Code
   x[i] = x[i-1];
   y[i] = y[i-1];
   }
   float targetX = random(0, width);
   float targetY = random(0, height);
   x[0] += (targetX - x[0])*easing;
   y[0] += (targetY - y[0])*easing;
   for (int i = 0; i <x.length; i++) {
   fill(i*4, i*sin(radians(i)), i*cos(radians(i)), i*4);
   ellipse(x[i], y[i], x[i]/100, x[i]/100);
   }
   */
}
