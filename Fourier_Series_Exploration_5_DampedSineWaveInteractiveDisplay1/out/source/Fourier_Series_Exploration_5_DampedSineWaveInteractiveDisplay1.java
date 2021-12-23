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

public class Fourier_Series_Exploration_5_DampedSineWaveInteractiveDisplay1 extends PApplet {

SineWave sampleSine1;
SineWave sampleSine2;
SineWave sampleSine3;
float x;
float x1, x2, x3;
float moveValue;

public void setup() {
  
  
  background(0);
  frameRate(240);
  x1 = width/2;
  x2 = height/2;
  x3 = 0;
  sampleSine1 = new SineWave(150, 5, 180, 1, 1, 0, 0, 0, 0, 0, -0.005f, 0, 0, 3, 0); 
  sampleSine2 = new SineWave(290, 4, 275, 1, 1, 0, 0, 0, 0, 0, -0.007f, 0, 0, 3, 0);
  sampleSine3 = new SineWave(320, 7, 75, 1, 1, 0, 0, 0, 0, 0, -0.009f, 0, 0, 3, 0); 
  /*An = temp_An;
   n = temp_n;
   xAxis = temp_xAxis;
   L = temp_L;
   ampDiv = temp_ampDiv;
   angF = temp_angF;
   Ts = temp_Ts;
   funcDisp = temp_funcDisp;
   cFuncDisp = temp_cFuncDisp;
   totalDisp = temp_totalDisp;
   dmpCoeff = temp_dmpCoeff;
   ampAdd = temp_ampAdd;
   ampAddScalar = temp_ampAddScalar;
   diameter = temp_diamter;
   xAxisCoeff = temp_xAxisCoeff
   speed = 1; */

  gridFunction();
}

public void draw() {
  //background(0);
  translate(0, x2);
  rotate(radians(270));
  fill(200, 200, 0, 175);
  sampleSine1.update();
  sampleSine1.display();
  fill(200, 0, 0, 175);
  sampleSine2.update();
  sampleSine2.display();
  fill(0, 150, 200, 175);
  sampleSine3.update();
  sampleSine3.display();
}

public void gridFunction() {
  fill(200, 200, 200);
  stroke(200, 200, 200);
  rect(10, 0, 2, height);
  rect(0, x2, width, 2);
}
class SineWave {
  float An, n, xAxis, L, ampDiv;
  float angF, Ts, funcDisp, cFuncDisp;
  float totalDisp, dmpCoeff;
  float ampAdd, ampAddScalar;
  float speed;
  float motionValue;
  float y;
  float diameter;
  float xAxisCoeff;

  SineWave(float temp_An, float temp_n, 
    float temp_xAxis, float temp_L, 
    float temp_ampDiv, float temp_angF, 
    float temp_Ts, float temp_funcDisp, 
    float temp_cFuncDisp, float temp_totalDisp, 
    float temp_dmpCoeff, float temp_ampAdd, 
    float temp_ampAddScalar, float temp_diameter, float temp_xAxisCoeff) {
    An = temp_An;
    n = temp_n;
    xAxis = temp_xAxis;
    L = temp_L;
    ampDiv = temp_ampDiv;
    angF = temp_angF;
    Ts = temp_Ts;
    funcDisp = temp_funcDisp;
    cFuncDisp = temp_cFuncDisp;
    totalDisp = temp_totalDisp;
    dmpCoeff = temp_dmpCoeff;
    ampAdd = temp_ampAdd;
    ampAddScalar = temp_ampAddScalar;
    diameter = temp_diameter;
    xAxisCoeff = temp_xAxisCoeff;
    speed = 0.1f;
    y = 10;
  }
  public void update() {

    xAxis += speed;
    xAxisCoeff += speed;
    y += speed;
    motionValue = Sine(xAxis);
  }
  public void display() {
    noStroke();
    ellipse(motionValue, y, diameter, diameter);
  }

  public float Sine(float indValue) {
    float sineValue = (exp(dmpCoeff*xAxisCoeff)*((An/ampDiv) - ampAdd*ampAddScalar)*((sin((radians((n*indValue)/L)))
      + (angF*Ts)) + funcDisp*cFuncDisp) + totalDisp); 

    //no need for PI, as it converts n*indValue with radian measure
    //Change to degrees() and put PI inside - shows a very nice graph
    return sineValue;
  }
}
  public void settings() {  size(1920, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Fourier_Series_Exploration_5_DampedSineWaveInteractiveDisplay1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
