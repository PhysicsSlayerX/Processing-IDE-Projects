import processing.opengl.*;

float x1, x2, x3, mX, mY, zoomX, zoomY, counter;
float parSize, sepDist, parN;
float maxScaleLimit, minScaleLimit;
float counter2;
float[] growthScale = {6, 5.5};

Star[] stars = new Star[5000];
float speed;
void setup() {
  fullScreen(P3D);
  //size(700, 700, OPENGL);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  x1 = width/2;
  x2 = height/2;
  x3 = 0;
  parSize = 0.3;
  sepDist = 5;
  parN = 50;
  minScaleLimit =0.5;
  maxScaleLimit=4.0;
}

void draw() {

  /*if (mouseX > width/2) {
   speed = map(mouseX, width/2, width, 5, 0);
   }
   if (mouseX < width/2) {
   speed = map(mouseX, 0, width/2, 0, 5);
   }*/
  speed = 5;
  background(0);
  translate(width/2, height/2);
  scale(0.35);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  cubeProg();
}
void cubeProg() {
  background(0);
  translate(x1, x2, x3);
  mX = map(mouseX, -x1, x1, 0, 360);
  mY = map(mouseY, -x2, x2, 0, 360);
  zoomX = map(mX, 0, 360, minScaleLimit, maxScaleLimit);
  zoomY = map(mY, 0, 360, minScaleLimit, maxScaleLimit);
  /*if (mX >10) {
   scale(zoomX);
   }
   if (mY>10) {
   scale(zoomY);
   }*/

  counter++;
  //counter2= pow(counter, 2);
  //counter2*=10;
  for (float z1 = -parN; z1 <= parN; z1=z1+sepDist) {

    pushMatrix();
    rotateX(radians(mX*sin(radians(counter/5))));
    rotateY(radians(mY*cos(radians(counter/5))));
    scale(growthScale[0]);
    translate(0, 0, z1);
    for (float y = -parN; y <= parN; y=y+sepDist) {
      for (float x = -parN; x <= parN; x=x+sepDist) {
        strokeWeight(parSize);
        stroke(0, 255, 0, 150+75*cos(radians(counter)));
        point(x, y);
      }
    }
    popMatrix();
  }
  for (float z2 = -parN/2; z2 <= parN/2; z2=z2+sepDist) {
    pushMatrix();
    rotateX(radians(mX*cos(radians(counter/2))));
    rotateY(radians(mY*sin(radians(counter/2))));
    scale(growthScale[1]+(growthScale[1]-1)*sin(radians(counter/5)));
    translate(0, 0, z2);
    for (float y = -parN/2; y <= parN/2; y=y+sepDist) {
      for (float x = -parN/2; x <= parN/2; x=x+sepDist) {
        strokeWeight(parSize);
        stroke(255, 0, 0, 175+75*sin(radians(counter)));
        point(x, y);
      }
    }
    popMatrix();
  }
}
