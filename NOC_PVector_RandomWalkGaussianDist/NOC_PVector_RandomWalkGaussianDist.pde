//Random Walks by the Nature of Code by Daniel Shiffman
import java.util.Random;

class Walker{ //class
  PVector vectorSample;
  Random gen1;
  Random gen2;
  
Walker(){ //constructor
  vectorSample = new PVector(0,0);
  gen1 = new Random();
  gen2 = new Random();
}


void display(){ //rendering the motion
  
  //stroke(random(255), random(255), random(255));
  noStroke();
  fill(255,100);
  ellipse(vectorSample.x,vectorSample.y,5,5);
  
  
}

void step(){ //defining the motion

/*
  int stepx = int(random(3))-1; //Yields -1,0,1
  int stepy = int(random(3))-1;
  x += stepx;
  y += stepy;
*/
  //step using floating numbers
  float num1 = (float)gen1.nextGaussian();
  float num2 = (float)gen2.nextGaussian();
  //float sd = 20;
  //float mean = width/2;
  float stepx = num1;
  float stepy = num2;
  
  vectorSample.x += stepx*10;
  vectorSample.y += stepy*10;
  //constraining the motion area: constrain(amt, low, high)
  //x = constrain(x,0,width/4-1);
  //y = constrain(y,0,height/4-1);
}
}
