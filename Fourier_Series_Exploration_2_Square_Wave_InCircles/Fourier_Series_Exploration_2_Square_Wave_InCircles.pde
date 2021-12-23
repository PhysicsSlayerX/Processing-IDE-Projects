SineWave sampleSine;
float speed = 1;
float x;
float x1, x2, x3;

void setup() {
  size(700, 700, P2D);
  frameRate(60);
  smooth();
  background(0);
  x1 = width/2;
  x2 = height/2;
  x3 = 0;
  sampleSine = new SineWave(1, 90, 0, 1.5, 150, 1, 5, 2); 
  //SineWave(n, x, y, L, speed, diameter, ampDiv)
}

void draw() {
  //background(0);
  translate(x1, x2);
  sampleSine.OrbitalSineWave();
  sampleSine.OrbitalDisplay();
}
