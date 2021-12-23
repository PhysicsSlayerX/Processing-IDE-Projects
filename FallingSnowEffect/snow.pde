class snow {
  float x;
  float y;
  float z;
  float sx;
  float sy;
  float diameter;
  float colorSnow;

  snow() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
  }
  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
    }
    sx = map(x/z, 0, 1, 10, width/2);
    sy = map(y/z, 0, 1, 10, height/2);
    diameter = map(z, width/2, 0, 2, 20);
    colorSnow = map(z, width/2, 0, 0, 255);
  }
  void display() {
    noStroke();
    fill(colorSnow);
    ellipse(sx, sy, diameter, diameter);
  }
}
