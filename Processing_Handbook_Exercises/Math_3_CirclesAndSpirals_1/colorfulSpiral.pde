class colorfulSpiral {
  float x1;
  float x2;
  float radius = 0.15;
  float cx;
  float cy;
  float px;
  float py;
  float rotCoeff;

  int colorFactor = 0;
  int deg;
  colorfulSpiral(float temp_x1, float temp_x2, float temp_cx, float temp_cy) {
    x1 = temp_x1;
    x2 = temp_x2;
    cx = temp_cx;
    cy = temp_cy;
    rotCoeff = 0;
    px = cx;
    py = cy;
  }
  void show() {
    translate(x1, x2);
    scale(1, -1);
    rotate(radians(rotCoeff));
    strokeWeight(1);
    for (int deg = 0; deg < 360*50; deg += 10) {
      colorFactor++;
      stroke(random(random(colorFactor)), 255, 255);
      float angle = radians(deg);
      float x = cx + (cos(angle)*radius);
      float y = cy + (sin(angle)*radius);
      line(px, py, x, y);
      radius*=1.02;
      px = x;
      py = y;
      if (colorFactor > 255) {
        colorFactor = 0;
      }
    }
  }
  void display() {
    pushMatrix();
    translate(x1, x2);
    scale(1, -1);
    strokeWeight(1);
    colorFactor++;
    deg+=90;
    stroke(colorFactor, 255, 255);
    float angle = radians(deg);
    float x = cx + (cos(angle)*radius);
    float y = cy + (sin(angle)*radius);
    line(px, py, x, y);
    radius*=1.01;
    px = x;
    py = y;
    if (colorFactor > 255) {
      colorFactor = 0;
    }
    popMatrix();
  }
}
