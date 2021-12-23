SineWave sampleSine;
float speed = 1;
float x;
float x1, x2, x3;

void setup() {
  size(1920, 700);
  smooth();
  background(0);
  x1 = width/2;
  x2 = height/2;
  x3 = 0;
  sampleSine = new SineWave(1, 90, 10, 150, 2, 7, 1, 0, 10); 
  //SineWave(n, x, L, An, speed, diameter, ampDiv, shiftWaveX,shiftWaveY)
  gridFunction();
}

void draw() {
  //background(0);
  sampleSine.OrbitalSineWave();
  sampleSine.OrbitalDisplay();
}

void gridFunction(){
  fill(200, 200, 200);
  stroke(200,200,200);
  rect(10,0, 2, height);
  rect(0,x2, width, 2);
}
