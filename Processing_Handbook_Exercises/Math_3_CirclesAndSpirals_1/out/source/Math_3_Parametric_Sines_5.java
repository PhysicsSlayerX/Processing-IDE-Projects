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

public class Math_3_Parametric_Sines_5 extends PApplet {

float x1,x2;
float scaleVal = 18.0f;
float angleInc = PI/28.0f;
float angle = 0.0f;
int x;

public void setup(){
  
  
  background(175);
  x1 = 0;
  x2 = 0;
  translate(x1, x2);
  strokeWeight(2);
  fill(255,20);
  for(int offset = -10; offset <= width; offset +=5){
    for(int y = 0; y <= height; y += 2){
      float x = offset + (sin(angle)*scaleVal);
      noStroke();
      ellipse(x,y, 10,10);
      stroke(0);
      point(x,y);
      angle += angleInc;
    }
  }
  angle += PI;
}

public void draw(){
  
}
  public void settings() {  size(1920, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Math_3_Parametric_Sines_5" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
