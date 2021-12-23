void setup() {
  float[][] distances;
  float maxDistance;
  size(800, 800);
  background(0);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int i = 0; i < height; i++) {
    for (int j=0; j<width; j++) {
      float dist = dist(width/2, height/2, j, i);
      distances[j][i] = pow((dist/maxDistance), 2)*255;
    }
  }
  float dist2 = dist(width/2, height/2, 0, 0);
  println(maxDistance);
  println(dist2);

  for (int i = 0; i<height; i++) {
    for (int j = 0; j<width; j++) {
      stroke(distances[j][i]*2, distances[j][i]*4, distances[j][i]/3);
      ellipse(j, i, 10, 10);
    }
  }
}

void draw() {
  exp(1, 5);
}

void exp(int base, int ept) {
  int[] exponent = new int[ept];
  for (int i = 0; i < ept; i++) {
    exponent[i] = i+1;
  }
  println(exponent[ept-1]);
  println(base);
}
