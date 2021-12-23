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

public class Math_3_Parametric_Sines_4 extends PApplet {

float x1,x2;
float offset = 126.0f;
float scaleVal = 126.0f;
float angleInc = 0.42f;
float angle = 0.0f;
int x;

public void setup(){
  
  
  background(175);
  x1 = 0;
  x2 = 0;
  translate(x1, x2);
  strokeWeight(2);

  for(int x = -150; x <= width; x +=5){
      float y = offset + (sin(angle)*scaleVal);
      stroke(y);
      line(x, 0, x+150, height);
      angle += angleInc;
  }
}

public void draw(){
  x+=5;
  float y = offset + (sin(angle)*scaleVal);
  stroke(y);
  line(x, 0, x+150, height);
  angle += angleInc;
}
  public void settings() {  size(1920, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Math_3_Parametric_Sines_4" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
