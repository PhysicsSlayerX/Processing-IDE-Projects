float x1,x2;
int degrees = 360;
float[] sinValues = new float[degrees];

void setup(){
  size(1920, 700);
  smooth();
  background(175);
  x1 = 0;
  x2 = height/2;
  translate(x1, x2);
  float r1 = radians(90);
  float r2 = radians(180);
  println("90 is: "+ r1);
  println("180 is: " + r2);
  float d1 = degrees(PI);
  float d2 = degrees(TWO_PI);
  println(d1);
  println(d2);

  float offset = 50.0;
  float scaleVal = 30.0;
  float angleInc = PI/56.0;
  float angle = 0.0;
  beginShape(TRIANGLE_STRIP);
  for(int x = 4; x <= width+5; x +=5){
      float y = (sin(angle)*scaleVal);
      if((x%2 == 0)){
        vertex(x, offset + y);
      } else {
        vertex(x, offset - y);
      }
      angle += angleInc;
  }
  endShape();
}

void draw(){
  
}
