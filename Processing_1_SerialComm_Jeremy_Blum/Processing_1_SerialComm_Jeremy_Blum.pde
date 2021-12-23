import processing.serial.*;
Serial port;
float brightness = 0;

void setup(){
  size(500,500);
  port = new Serial(this, "COM9", 9600);
  port.bufferUntil('\n'); // \n is newline. bufferUntil is like 
  //while loop, waiting
  //until it get something.
}
void draw(){
  background(0,0,brightness);
}

void serialEvent (Serial port){
  brightness = float(port.readStringUntil('\n'));
}
