SineWave sampleSine1;
SineWave sampleSine2;
SineWave sampleSine3;
float x;
float x1, x2, x3;
float moveValue;

void setup() {
  size(1920, 700);
  smooth();
  background(0);
  frameRate(120);
  x1 = width/2;
  x2 = height/2;
  x3 = 0;
  sampleSine1 = new SineWave(150, 5, 180, 1, 1, 0, 0, 0, 0, 0, -0.005, 0, 0, 3, 0); 
  sampleSine2 = new SineWave(290, 4, 275, 1, 1, 0, 0, 0, 0, 0, -0.007, 0, 0, 3, 0);
  sampleSine3 = new SineWave(320, 7, 75, 1, 1, 0, 0, 0, 0, 0, -0.009, 0, 0, 3, 0); 
  /*An = temp_An;
   n = temp_n;
   xAxis = temp_xAxis;
   L = temp_L;
   ampDiv = temp_ampDiv;
   angF = temp_angF;
   Ts = temp_Ts;
   funcDisp = temp_funcDisp;
   cFuncDisp = temp_cFuncDisp;
   totalDisp = temp_totalDisp;
   dmpCoeff = temp_dmpCoeff;
   ampAdd = temp_ampAdd;
   ampAddScalar = temp_ampAddScalar;
   diameter = temp_diamter;
   xAxisCoeff = temp_xAxisCoeff
   speed = 1; */

  gridFunction();
}

void draw() {
  //background(0);
  translate(0, x2);
  rotate(radians(270));
  fill(200, 200, 0, 175);
  sampleSine1.update();
  sampleSine1.display();
  fill(200, 0, 0, 175);
  sampleSine2.update();
  sampleSine2.display();
  fill(0, 150, 200, 175);
  sampleSine3.update();
  sampleSine3.display();
}

void gridFunction() {
  fill(200, 200, 200);
  stroke(200, 200, 200);
  rect(10, 0, 2, height);
  rect(0, x2, width, 2);
}
