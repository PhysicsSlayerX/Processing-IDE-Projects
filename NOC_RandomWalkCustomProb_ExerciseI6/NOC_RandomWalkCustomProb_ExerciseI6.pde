//Exercise I.6- The Nature of Code by Daniel Shiffman
import java.util.Random;

class Walker{ //class
  int x;
  int y;
  int z;

  
Walker(){ //constructor
  x = 0;
  y = 0;
 
}


void display(){ //rendering the motion
  
  //stroke(random(255), random(255), random(255));
  noStroke();
  fill(255,100);
  ellipse(x,y,5,5);
  
  
}

void step(){ //defining the motion


  float num = stepsize();
  float stepx = random(-num, num);
  float stepy = random(-num, num);
  
  x += stepx*10;
  y += stepy*10;
  //constraining the motion area: constrain(amt, low, high)
  //x = constrain(x,0,width/4-1);
  //y = constrain(y,0,height/4-1);
}

float stepsize(){
  while(true){
    float r1 = random(1);
    float prob = r1*r1;
    float r2 = random(1);
    
    if (r2 < prob){
      return r1;
    }
  }
}

}
