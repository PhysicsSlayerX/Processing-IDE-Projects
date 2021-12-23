int locX = 215;
int locY = 215;
int x, y, w, h;
int locX2 = 315;
int locY2 = 315;


void setup() {
  size(800, 800);
  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
}

void draw() {
  background(0);
  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      locX-=10;
    } else if (keyCode == RIGHT) {
      locX+=10;
    }
    if (keyCode == UP) {
      locY-=10;
    } else if (keyCode == DOWN) {
      locY+=10;
    }
  }
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      locY2-=10;
    } else if (key == 's' || key == 'S') {
      locY2+=10;
    }
    if (key == 'a' || key == 'A') {
      locX2-=10;
    } else if (key == 'd' || key == 'D') {
      locX2+=10;
    }
  }

  ellipse(locX, locY, 50, 50);
  ellipse(locX2, locY2, 100, 100);
  if (((locX > x && locX < x+w) && (locY > y && locY < y+h))||((locX2 > x && locX2 < x+w) && (locY2 > y && locY2 < y+h))) {
    fill(0);
  } else {
    fill (255);
  }

  ellipse(x, y, w, h);
}
