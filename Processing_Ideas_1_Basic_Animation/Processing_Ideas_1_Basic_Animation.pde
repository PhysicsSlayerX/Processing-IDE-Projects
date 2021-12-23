float x = 0;
float y = 0;

void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  background(0);
  animOnce();
  animMultiple();
  l_animOnce();
  l_animMultiple();
  y_animMultiple();
}

void animOnce() {
  for (float i = 0; i <= 5; i++) { // finishes the animation after fulfilling
    // i <= 5.
    x = x + i/100;
    noStroke();
    fill(255);
    ellipse(x, x, 20, 20);
  }
}

void animMultiple() {
  animOnce();
  x++;
  stroke(255);
  line(x-100, 0, x-3, x);
  if (x > width ) { //creates a looping 
    x = 0;
  }
}

void l_animOnce() {
  for (float i = 0; i <= 5; i++) { // finishes the animation after fulfilling
    // i <= 5.
    y = - y - i/5;
    noStroke();
    fill(255);
    ellipse(y+399, y+399, 20, 20);
  }
}

void l_animMultiple() {
  animOnce();
  x++;
  stroke(255);
  line(-x+399, 399, x-3, x);
  if (y < -width ) { //creates a looping 
    y = 0;
  }
}

void y_animMultiple() {
  l_animOnce();
  y--;
  stroke(255);
  line(-y+399-100, 0, y+399, y+399);
  if (y < -width ) { //creates a looping 
    y = 0;
  }
}
