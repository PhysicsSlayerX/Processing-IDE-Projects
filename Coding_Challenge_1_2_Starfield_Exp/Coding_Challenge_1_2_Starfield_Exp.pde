Star[] stars = new Star[1000];
float speed;
SWShip Ship;
float mouse_X, mouse_Y, scalar_value;

void setup() {
  size(700, 700);
  PShape ship1 = loadShape("Ship1.svg");

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  Ship = new SWShip(ship1);
  shapeMode(CENTER);
}

void draw() {

  if (mouseX > width/2) {
    speed = map(mouseX, width/2, width, 50, 0);
  }
  if (mouseX < width/2) {
    speed = map(mouseX, 0, width/2, 0, 50);
  }
  background(0);
  Ship.update();
  Ship.display();

  translate(width/2, height/2);
  if (mousePressed && (mouseButton == LEFT)) {
    scalar_value = map(mouseX, width/2, width, 0.1, 0.8);
    scale(scalar_value);
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    scalar_value = map(mouseX, 0, width, 0.3, 1);
    scale(scalar_value);
  }

  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
