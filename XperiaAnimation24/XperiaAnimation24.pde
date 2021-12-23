float x, y, xi, yi, count, init1, motionY;
float easing = 0.1;
float[] coswave = new float[height];

void setup() {
  size(700, 700, P2D);
  frameCount = 120;
  smooth();
  stroke(255);
  x = width/2;
  y = height/2;
  for (int i = 0; i < height/2; i++) {
    float amount = map(i, 0, height/2, 0, PI);
    coswave[i] = abs(cos(amount));
  }
}

void draw() {
  background(0);
  translate(x, y);
  count = millis()/10;
  init1 = sin(radians(count));
  motionY += (init1 - motionY)*easing;
  for (int i = - width/2; i < width/2; i++) {
    for (int j = 0; j < height/2; j++) {

      fill(255);
      ellipse(i, coswave[j]*motionY, 20, 20);
    }
  }
}
