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
  float scaleVal = 20.0;
  float angleInc = PI/18.0;
  float angle = 0.0;
  for(int x = 0; x <= width; x +=5){
      float y = offset + (sin(angle)*scaleVal);
      fill(255);
      rect(x,y,2,4);
      angle += angleInc;
      y = offset + (cos(angle)*scaleVal);
      fill(0);
      rect(x,y, 2,4);
      angle += angleInc;
  }
  
}

void draw(){
  
}
