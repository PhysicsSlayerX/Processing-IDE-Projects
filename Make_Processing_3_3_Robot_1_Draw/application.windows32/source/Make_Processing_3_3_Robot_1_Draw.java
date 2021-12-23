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

public class Make_Processing_3_3_Robot_1_Draw extends PApplet {

float x = 0;
float y = 0;

public void setup() {
  
  frameRate(30);
  
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
}

public void draw() {
  background(255);
  Neck();
  antennae();
  Body();
  Head();
}


public void Neck() {
  stroke(102);
  x = x + 1;
  line(266, 257-x, 266, 162);
  line(276, 257-2*x, 276, 162);
  line(286, 257-3*x, 286, 162);
  while (x == 20) {
    x = x - 5;
  }
}
public void antennae() {
  x++;
  y = y + 1;
  line(276, 155, 246+x, 112-x);
  line(276, 155, 306-x, 56+x);
  line(276, 155, 342+x, 170-x);
  while (x == 6) {
    x = x - 5;
  }
}

public void Body() {
  x++;
  noStroke();
  fill(102);
  ellipse(264-x/10, 377, 33, 33);
  
  fill(0);
  rect(219, 257+x/10, 90, 120);
  fill(102);
  rect(219, 274+x/10, 90, 6);
  //fill(100, 0,0);
  //quad(250, 300, 270, 300, 250-x, 400-x, 200+x, 350+x );
  fill(0, 100, 0);
  quad(270-x/10, 300-x/10, 300+x/10, 300-x/10, 300+x/10, 325+x/10, 270-x/10, 325+x/10);
  while (x == 3) {
    x = x-2;
  }
}

public void Head() {
  x = x + 1/10;
  y = y + 1/10;
  fill(0);
  ellipse(276, 155, 45, 45);
  fill(255, 255-x*4, 255-x*4);
  ellipse(288+ 3*sin(x), 150+4*cos(y), 14, 14);
  fill(0);
  ellipse(288+3*cos(x), 150+3*sin(y), 3, 3);
  while (x == 20) {
    x = 0;
    y = 0;
  }
  fill(153);
  ellipse(263, 148, 5, 5);
  ellipse(296, 130, 4, 4);
  ellipse(305, 162, 3, 3);
}

  public void settings() {  size(720, 480);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Make_Processing_3_3_Robot_1_Draw" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
