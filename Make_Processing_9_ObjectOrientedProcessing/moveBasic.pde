class moveBasic {
  float x_amp;
  float y_amp;
  float x;
  float y;
  float inc;
  float scalar;
  float diameter;

  moveBasic(float tempXamp, float tempYamp, float tempDiameter, float tempScalar) {
    x_amp = tempXamp;
    y_amp = tempYamp;
    diameter = tempDiameter;
    scalar = tempScalar;
  }
  void move() {
    inc+=scalar;
    x = x_amp*cos(radians(inc));
    y = y_amp*sin(radians(inc));
  }
  void display() {
    pushMatrix();
    translate(x, y);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}
