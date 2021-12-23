//Random Walks by the Nature of Code by Daniel Shiffman

//Revise. I'm still not sure about the code is working or not.
class Walker{
  int x;
  int y;

 
Walker(){
  x = 0;
  y = 0;

}


void display(){
  
  stroke(random(255), random(255), random(255));
  strokeWeight(5);
  ellipse(x,y, 2,2);
  
  
}

void step(){
  float prob = 0.50;
  //float choice = (random(0,map(mouseX, -width/2, width/2, -1,1)));
  float choiceX = random(0, map(mouseX, -width/2, width/2, 0.50,1));
  float choiceY = random(0, map(mouseY, -height/2, height/2, 0.50,1));
  //float choiceY = random(map(mouseY, -height, height, -1,1));
  //float choice = (choiceX+choiceY)/2;
  
  if(choiceX < prob){
    x=x-2;
  } else {
    x=x+2;
  }
  if(choiceY < prob){
    y=y-2;
  } else {
    y=y+2;
  }

}
}
 /* } else if (choiceY < 0.5){
    y=y+2;
  } else {
    y=y-2;
  }
  */
