import processing.opengl.*;
void setup() {
  size(700, 700, OPENGL);
  noStroke();
  fill(255);
}
void draw() {
  
  lights();
  //ambientLight(102, 102, 102);
  //directionalLight(255, 255, 255, -1, 0, 0); // Direction XYZ
  //pointLight(255, 255, 255, mouseX, 110, 50); // Position
  spotLight(255, mouseX, mouseY, mouseX, mouseY, mouseX, 0, 0, -1, PI, 2); // Concentration
  rotateY(PI/24);
  background(0);
  translate(width/2, height/2, -20);
  int dim = 18;
  for (int i = -height/2; i < height/2; i += dim*1.4) {
    for (int j = -height/2; j < height/2; j += dim*1.4) {
      pushMatrix();
      translate(i, j, -j);
      box(dim, dim, dim);
      popMatrix();
    }
  }
}
