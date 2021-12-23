 import processing.serial.*;
 Serial port;
 
 //variable to use
 String temp_c = "";
 String temp_f = "";
 String data = "";
 int index = 0;
 PFont font;
 
 void setup(){
  size(400,400);
  port = new Serial(this, "COM8", 9600);
  port.bufferUntil('.');
  font = loadFont("AgencyFB-Bold-200.vlw");
  textFont(font, 200);
 }
 void draw(){
  background(0,0,0);
  fill(46, 209,2);
  text(temp_c,70, 175);
  fill(0, 102, 153);
  text(temp_f, 70, 370);
 }
 
 void serialEvent(Serial port){
  data = port.readStringUntil('.'); //the dot signfies
                                    //the end of the string
  
  try{
    data = data.substring(0, data.length() - 1);//you don't want to see the dot,
                                              //so you "hide" it by including
                                              //all the characters from 0 to the
                                              //end except the dot.
  //look for comma
    index = data.indexOf(","); // means that the temp details
                              //were separated by a comma.
    temp_c = data.substring(0, index);
  //fetch farenheit
    temp_f = data.substring(index+1, data.length());
  } finally {}
}
