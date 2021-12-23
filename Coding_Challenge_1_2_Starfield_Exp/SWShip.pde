class SWShip {
  float x, y;
  PShape SWShipShape;
  float scalar_value;

  SWShip(PShape tempShape) {
    SWShipShape = tempShape;
  }
  void update() {

    x = mouseX;
    y = mouseY;

    if (mouseX > width/2) {
      scalar_value = map(mouseX, width/2, width, 0.2, 0.8);
    }
    if (mouseX < width/2) {
      scalar_value = map(mouseX, 0, width/2, 0.8, 0.2);
    }
    
  }
  void display() {
    pushMatrix();
    translate(mouseX, mouseY);
    scale(scalar_value);
    shape(SWShipShape, 0, 0);
    popMatrix();
  }
}
