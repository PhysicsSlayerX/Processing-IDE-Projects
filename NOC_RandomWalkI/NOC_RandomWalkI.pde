//Random Walks by the Nature of Code by Daniel Shiffman
class Walker{
  int x;
  int y;
  int z;
 
Walker(){
  x = 0;
  y = 0;
  z = 0;
}


void display(){
  
  stroke(random(255), random(255), random(255));
  strokeWeight(2);
  point(x,y,z);
  
  
}

void step(){
  int choice = int(random(6));
  if(choice == 0){
    x=x+2;
  } else if (choice == 1){
    x=x-2;
  } else if (choice == 2){
    y=y+2;
  } else if (choice == 3){
    y=y-2;
  } else if (choice == 4){
    z=z+2;
  } else {
    z=z-2;
  }
}
}
