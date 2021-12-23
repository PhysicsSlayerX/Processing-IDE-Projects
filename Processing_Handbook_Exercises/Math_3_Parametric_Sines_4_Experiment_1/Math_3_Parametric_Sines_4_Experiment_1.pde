float x1,x2;
float offset = 126.0;
float scaleVal = 126.0;
float angleInc = 0.1;
float angle = 0.0;
float[] colorArray = new float[2500];
int y;

void setup(){
  size(1920, 700);
  smooth();
  background(175);
  x1 = 0;
  x2 = 0;
  translate(x1, x2);
  strokeWeight(2);
  for(int x = 0; x < colorArray.length; x++){
      colorArray[x] = offset + (sin(angle)*scaleVal);
      angle += angleInc;
  }  
  println(colorArray.length);
  for(int x = 0; x < colorArray.length; x++){
    stroke(colorArray[x], colorArray[x]+random(colorArray[x]), colorArray[x]+20);
    line(x-300, 0, x, height);
  }
}

void draw(){
}
