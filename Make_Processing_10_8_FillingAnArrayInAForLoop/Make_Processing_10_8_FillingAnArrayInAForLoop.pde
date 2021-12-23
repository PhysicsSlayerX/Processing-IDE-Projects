float[] gray;

void setup() {
  size(700, 700);
  gray = new float[width];
  for (int i=0; i< gray.length; i++) {
    gray[i] = random(0, 255);
  }
}

void draw() {
  for (int i = 0; i < gray.length; i++) {
    
    stroke(gray[i],20);
    line(i*sin(radians(i)), 0, i*cos(radians(i)), height);
    line(0, i, width, i);
  }
}
