Robot[] bots; // Declare array of Robot objects
Robot[] bots2;
float[] gray;
float inc;


void setup() {
  //fullScreen();
  size(700, 700, P2D);
  PShape robotShape = loadShape("Ship1.svg");
  PShape robotShape2 = loadShape("robot1.svg");

  bots = new Robot[30];
  bots2 = new Robot[1000];

  for (int i = 0; i < bots.length; i++) {

    float x = random(-1000, width*2);
    float y = map(i, 0, bots.length, -height, height*2);
    bots[i] = new Robot(robotShape, x, y, 1, 0.5);
  }
  for (int i = 0; i < bots2.length; i++) {

    float x = random(-1000, width*5);
    float y = map(i, 0, bots.length, -height, height);
    bots2[i] = new Robot(robotShape2, x, y, 0.3, 10);
  }
  smooth();
  gray = new float[width];
  for (int i=0; i< gray.length; i++) {
    gray[i] = random(0, 255);
  }
}
void draw() {

  background(50, 175, 250);
  scale(0.35);
  for (int i = 0; i < gray.length; i++) {
    strokeWeight(2);
    stroke(gray[i]);
    line(0, i*10, width*4, i*10);
  }

  for (int i = 0; i < bots.length; i++) {
    bots[i].update();
    bots[i].display();
  }
  for (int i = 0; i < bots2.length; i++) {

    bots2[i].update();
    bots2[i].display();
  }
}
class Robot {
  float xpos;
  float ypos;
  float angle;
  PShape botShape;
  float sizeBot;
  float yoffset = 0.0;
  float xoffset;
  float linearInc;
  float sizeInc;
  //float scalar;
  // Set initial values in constructor
  Robot(PShape shape, float tempX, float tempY, float tempSizeBot, float tempLinearInc/*, float tempScalar*/) {
    botShape = shape;
    sizeBot = tempSizeBot;
    xpos = tempX;
    ypos = tempY;
    linearInc = tempLinearInc;
    angle = random(0, TWO_PI);
   // scalar = tempScalar;
  }

  // Update the fields
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
    xoffset += random(linearInc);
    if (xoffset > width*9.5) {
      xoffset = -width*9.5;
    }
    //botShape.scale(scalar);
  }
  // Draw the robot to the screen
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    
    shape(botShape, xpos+xoffset, ypos + yoffset);
    popMatrix();
  }
}
