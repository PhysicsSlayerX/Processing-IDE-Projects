float x1,x2;
float offset = 126.0;
float scaleVal = 126.0;
float angleInc = 0.42;
float angle = 0.0;
int x;

void setup(){
  size(1920, 700);
  smooth();
  background(175);
  x1 = 0;
  x2 = 0;
  translate(x1, x2);
  strokeWeight(2);

  for(int x = -150; x <= width; x +=5){
      float y = offset + (sin(angle)*scaleVal);
      stroke(y);
      line(x, 0, x+150, height);
      angle += angleInc;
  }
}

void draw(){
  x+=5;
  float y = offset + (sin(angle)*scaleVal);
  stroke(y);
  line(x, 0, x+150, height);
  angle += angleInc;
}
