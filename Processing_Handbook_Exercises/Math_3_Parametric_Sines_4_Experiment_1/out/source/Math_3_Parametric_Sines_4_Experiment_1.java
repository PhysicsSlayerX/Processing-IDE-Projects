import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Math_3_Parametric_Sines_4_Experiment_1 extends PApplet {

float x1,x2;
float offset = 126.0f;
float scaleVal = 126.0f;
float angleInc = 0.1f;
float angle = 0.0f;
float[] colorArray = new float[2500];
int y;

public void setup(){
  
  
  background(175);
  x1 = 0;
  x2 = 0;
  translate(x1, x2);
  strokeWeight(2);
  for(int x = 0; x < colorArray.length; x++){
      colorArray[x] = offset + (sin(angle)*scaleVal);
      angle += angleInc;
  }  
  println(colorArray.length);
  for(int x = 0; x < colorArray.length; x++){
    stroke(colorArray[x], colorArray[x]+random(colorArray[x]), colorArray[x]+20);
    line(x-300, 0, x, height);
  }
}

public void draw(){
}
  public void settings() {  size(1920, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Math_3_Parametric_Sines_4_Experiment_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
