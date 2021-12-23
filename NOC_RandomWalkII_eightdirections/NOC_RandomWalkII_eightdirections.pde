//Random Walks by the Nature of Code by Daniel Shiffman
class Walker{ //class
  int x;
  int y;
  int z;
 
Walker(){ //constructor
  x = 0;
  y = 0;
  z = 0;
}


void display(){ //rendering the motion
  
  //stroke(random(255), random(255), random(255));
  stroke(255);
  strokeWeight(1);
  point(x,y);
  
  
}

void step(){ //defining the motion

/*
  int stepx = int(random(3))-1; //Yields -1,0,1
  int stepy = int(random(3))-1;
  x += stepx;
  y += stepy;
*/
  //step using floating numbers
  float stepx = random(-1,1);
  float stepy = random(-1,1);
  
  x += stepx*20;
  y += stepy*20;
  //constraining the motion area: constrain(amt, low, high)
  x = constrain(x,0,width/4-1);
  y = constrain(y,0,height/4-1);
}
}
