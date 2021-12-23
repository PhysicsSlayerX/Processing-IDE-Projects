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

public class Math_3_Parametric_Sines_2 extends PApplet {

float x1,x2;
int degrees = 360;
float[] sinValues = new float[degrees];

public void setup(){
  
  
  background(175);
  x1 = 0;
  x2 = height/2;
  translate(x1, x2);
  float r1 = radians(90);
  float r2 = radians(180);
  println("90 is: "+ r1);
  println("180 is: " + r2);
  float d1 = degrees(PI);
  float d2 = degrees(TWO_PI);
  println(d1);
  println(d2);

  float offset = 50.0f;
  float scaleVal = 20.0f;
  float angleInc = PI/18.0f;
  float angle = 0.0f;
  for(int x = 0; x <= width; x +=5){
      float y = offset + (sin(angle)*scaleVal);
      fill(255);
      rect(x,y,2,4);
      angle += angleInc;
      y = offset + (cos(angle)*scaleVal);
      fill(0);
      rect(x,y, 2,4);
      angle += angleInc;
  }
  
}

public void draw(){
  
}
  public void settings() {  size(1920, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Math_3_Parametric_Sines_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
