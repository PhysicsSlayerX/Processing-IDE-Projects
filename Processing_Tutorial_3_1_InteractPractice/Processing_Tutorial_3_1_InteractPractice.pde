//Interact

//setup: once at the start
//draw: loop forever
//void - code that tells the function doesn't return anything after code execution
//variable - word that represents a number
void setup(){
  size(500,500); //size(width, height);
  
}

void draw(){
  background(0);
  stroke(255,255,255);
  fill(160,220,90);
  ellipse(mouseX/3,mouseY,10,10);
  
  stroke(30);
  fill(160,20,230);
  rect(mouseY/3, mouseX, 10,10);
}
