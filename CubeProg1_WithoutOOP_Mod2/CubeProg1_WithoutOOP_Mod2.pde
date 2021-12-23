import processing.opengl.*;

float x1, x2, x3, mX, mY, zoomX, zoomY, counter;
float parSize, sepDist, parN;
float maxScaleLimit, minScaleLimit;
float counter2;
float[] growthScale = {6, 5.5};

void setup() {
  size(1920, 1080, P3D);
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
  for (float z = -parN; z <= parN; z=z+sepDist) {

    pushMatrix();
    rotateX(radians(mX*sin(radians(counter/5))));
    rotateY(radians(mY*cos(radians(counter/5))));
    scale(growthScale[0]);
    translate(0, 0, z);
    for (float y = -parN; y <= parN; y=y+sepDist) {
      for (float x = -parN; x <= parN; x=x+sepDist) {
        strokeWeight(parSize);
        stroke(0, 255, 0, 150+75*cos(radians(counter)));
        point(x, y);
      }
    }
    popMatrix();
  }
  for (float z = -parN/2; z <= parN/2; z=z+sepDist) {
    pushMatrix();
    rotateX(radians(mX*cos(radians(counter/2))));
    rotateY(radians(mY*sin(radians(counter/2))));
    scale(growthScale[1]+(growthScale[1]-1)*sin(radians(counter/5)));
    translate(0, 0, z);
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
