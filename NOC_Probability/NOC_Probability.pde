//Random Walks by the Nature of Code by Daniel Shiffman
class Walker{
  int x;
  int y;

 
Walker(){
  x = 0;
  y = 0;

}


void display(){
  
  stroke(random(255), random(255), random(255));
  strokeWeight(2);
  point(x,y);
  
  
}

void step(){
  float choice = random(1);
  if(choice < 0.1){
    x=x+2;
  } else if (choice < 0.5){
    x=x-2;
  } else if (choice < 0.8){
    y=y+2;
  } else {
    y=y-2;
  }
}
}
