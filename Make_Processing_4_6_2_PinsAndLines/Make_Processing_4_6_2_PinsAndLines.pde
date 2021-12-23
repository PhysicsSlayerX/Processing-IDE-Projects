int heightMod = 700;
int widthMod = 700;

size(700, 700);
background(0);
smooth();
for (int y = 20; y <= height-20; y += 10) {
  for (int x = 20; x <= width-20; x +=10) {
    for (int z = 0; z <= 255; z += 10) {
      ellipse(x, y, 4, 4);
      map(x, 0, width-20, 0, 255);
      map(y, 0, height-20, 0, 255);
      stroke(x,y,z);
      fill(x,y,z);
      line(x, y, heightMod/2 - 1, widthMod/2 - 1);
    }
  }
}
