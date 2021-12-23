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

  for(float angle = 0; angle < TWO_PI; angle += PI/24.0){
      println(sin(angle));
  }
  for(int i = 0; i < degrees; i++){
      sinValues[i] = sin(TWO_PI/degrees*i);
  }
  for(int i = 0; i < sinValues.length; i++){
      fill(0);
      ellipse(i, 200*sinValues[i], 10,10 );
  }
  
}

void draw(){
  
}
