float x1,x2;
float scaleVal = 18.0;
float angleInc = PI/28.0;
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
  fill(255,20);
  for(int offset = -10; offset <= width; offset +=5){
    for(int y = 0; y <= height; y += 2){
      float x = offset + (sin(angle)*scaleVal);
      noStroke();
      ellipse(x,y, 10,10);
      stroke(0);
      point(x,y);
      angle += angleInc;
    }
  }
  angle += PI;
}

void draw(){
  
}
