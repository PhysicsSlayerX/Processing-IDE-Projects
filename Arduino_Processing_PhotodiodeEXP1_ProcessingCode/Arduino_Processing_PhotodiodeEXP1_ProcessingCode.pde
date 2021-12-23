import processing.serial.*;

Serial port;
float val;
String data = "";

void setup() {
  size(700, 700);
  port = new Serial(this, "COM6", 9600);
  port.bufferUntil('.');
}

void draw() {
  background(0);
  val = map(val, 0, 1023, 0, height);
  rect(100, val, 360, 20);
}
void serialEvent (Serial port) {
  data = port.readStringUntil('.');
  val = int(data);
}
