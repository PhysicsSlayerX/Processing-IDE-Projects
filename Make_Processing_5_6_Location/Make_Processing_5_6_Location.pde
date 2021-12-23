//Find the cursor:

float x;
float y;
int offsetX = 10;
int offsetY = 10;

void setup() {

  size(700, 700);
  smooth();
  x = width/2;
  y = height/2;
  stroke(255);
}
void draw() {

  background(0);
  if (mouseX >= x && mouseY >= y) {
    x+=5;
    y+=5;
    offsetX = -10;
    offsetY = -10;
  }
  if (mouseX < x && mouseY < y) {
    x -= 5;
    y -= 5;
    offsetX = 10;
    offsetY = 10;
  }
  if (mouseX >= x && mouseY < y) {
    x+=5;
    y-=5;
    offsetX = -10;
    offsetY = 10;
  }
  if (mouseX < x && mouseY >= y) {
    x -= 5;
    y += 5;
    offsetX = 10;
    offsetY = -10;
  }
  lineAndArrow();
}
void lineAndArrow() {
  line(x, 0, x, height);
  line(0, y, width, y);
  line(mouseX, mouseY, mouseX + offsetX, mouseY - 10);
  line(mouseX, mouseY, mouseX + offsetX, mouseY + 10);
  line(mouseX, mouseY, mouseX + offsetX*3, mouseY);
  line(mouseX, mouseY, mouseX +10, mouseY + offsetY);
  line(mouseX, mouseY, mouseX -10, mouseY + offsetY);
  line(mouseX, mouseY, mouseX, mouseY+ offsetY*3);
  fill(255, 0, 0, 50);
  ellipse(x, y, 50, 50);
  if ((( x < mouseX+offsetX*5 && y < mouseY+offsetY*5) && (x >= mouseX-offsetX*5 && y >= mouseY - offsetY*5)) 
    || (( x < mouseX+offsetX*5 && y >= mouseY+offsetY*5) && ( x >= mouseX+offsetX*5 && y < mouseY+offsetY*5))) {
    fill(255);
    ellipse(x, y, 50, 50);
  }
}
