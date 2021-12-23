int startX = 200;
int stopX = 1000;
int startY = 300;
int stopY = 1400;
float x = startX;
float y = startY;
float step = 0.00005;
float pct = 0.0;
float counter;

void setup() {
  size(900, 900);
  smooth();
  background(0);
}

void draw() {
  counter +=1;
  translate(width/2, height/2);
  scale(0.11);
  rotate(radians(counter));
  if (pct < 1.0) {
    x = startX + ((stopX - startX)*pct);
    y = startY + ((stopY - startX)*pct);
    pct += step;
  } else if (pct > 1.0) {
    pct = 0.0;
  }
  fill(abs(255*sin(x))+30, 0, 0);
  ellipse(cos(x)*500, sin(y)*500, 15*sin(x), 15*cos(y));
  fill(0, 225, 0);
  ellipse(sin(x)*500, cos(y)*500, 7, 7);
  fill(0, 170, 250);
  ellipse(tan(x)*500, (1/tan(y))*500, 7, 7);
  fill(200, 170, 250);
  ellipse(sin(x)*(1000*sin(radians(counter))), (cos(y))*(1000*sin(radians(counter))), 7, 7);
}
