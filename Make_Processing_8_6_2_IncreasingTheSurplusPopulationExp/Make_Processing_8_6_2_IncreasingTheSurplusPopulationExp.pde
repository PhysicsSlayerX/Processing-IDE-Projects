void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  background(204);
  for (int x = 35; x < width + 70; x += 70) {
    for (int y = 35; y < width + 70; y += 70) {
      owl(x, y);
    }
  }
}
void owl(int x, int y) {
  pushMatrix();
  translate(x, y);
  //scale(2);
  stroke(0);
  strokeWeight(70);
  line(0, -35, 0, -65); // body
  noStroke();
  fill(randomColor(255),randomColor(255),randomColor(255));
  ellipse(-17.5, -65, 35, 35);
  ellipse(17.5, -65, 35, 35);
  arc(0, -65, 70, 70, 0, PI);
  fill(randomColor(255),randomColor(255),randomColor(255));
  ellipse(-14, -65, 8, 8);
  ellipse(14, -65, 8, 8);
  quad(0, -58, 4, -51, 0, -44, -4, -51);
  popMatrix();
}

int randomColor(int colorNum) {
  int colorCode = 1 + int(random(colorNum));
  return(colorCode);
}
