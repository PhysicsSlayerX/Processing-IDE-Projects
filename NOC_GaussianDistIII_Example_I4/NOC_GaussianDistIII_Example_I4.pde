//Example I.4, Nature of Code
import java.util.Random;

Random generator;
void setup(){
  size(720 ,720);
  generator = new Random();
  background(0);
}
void draw(){
 
 float num1 = (float)generator.nextGaussian();
 float num2 = (float)generator.nextGaussian();
 float sd1 = 60;
 float mean1 = 0;
 float sd2 = 60;
 float mean2 = 0;
 
 float x = sd1*num1+mean1;
 float y = sd2*num2+mean2;
 
 translate(width/2,height/2);
 noStroke();
 fill((255/2)*abs(num1)+50,255*num2+50,255*num1*num2+50);
 ellipse(x,y,50*x/60,50*x/60);
}
