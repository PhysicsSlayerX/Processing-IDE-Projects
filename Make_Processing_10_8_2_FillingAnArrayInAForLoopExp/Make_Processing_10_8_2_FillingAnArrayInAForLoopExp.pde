float[] colorR, colorG, colorB;
float inc;

void setup() {
  size(700, 700,P2D);
  colorR = new float[width];
  colorG = new float[width];
  colorB = new float[width];
  for (int i=0; i< colorR.length; i++) {
    colorR[i] = random(0, 255);
    colorG[i] = random(0, 255);
    colorB[i] = random(0, 255);
  }
}

void draw() {
  //background(204);
  //inc = random(0,1000);
  inc++;
  for (int i = 0; i < colorR.length; i++) {
    stroke(colorR[i],colorG[i],colorB[i], 255);
    line(i*sin(radians(inc)), 0, i*cos(radians(inc)), height);
    line(0, i*sin(radians(inc)), width, i*cos(radians(inc)));
  }
}
