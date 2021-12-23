import processing.serial.*;
Serial myPort;


float x_translate;
float y_translate;
int[] fillColor = new int[12];
int[] ellipsePosition = new int[12];



void setup() {
  size(700, 700);
  myPort = new Serial(this, "COM9", 9600);
  myPort.bufferUntil('\n');
  smooth();
  x_translate = width/2;
  y_translate = height/2;
  for (int i = 0; i <12; i+=12) {
    ellipsePosition[i] = i;
  }
}

void draw() {
  background(204);
  translate(x_translate, y_translate);
  for (int j = 0; j < 12; j++) {
    fill(fillColor[j]);
    ellipse(ellipsePosition[j], 0, 6, 50);
  }
}
void serialEvent (Serial myPort) {
  for (int k = 0; k <12; k++) {
    fillColor[k] = int(myPort.readStringUntil('\n'));
  }
}
