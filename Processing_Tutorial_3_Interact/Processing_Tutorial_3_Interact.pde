//Interact

//setup: once at the start
//draw: loop forever
//void - code that tells the function doesn't return anything after code execution
//variable - word that represents a number
void setup(){
  size(500,500); //size(width, height);
  background(0);
}

void draw(){
  
  stroke(255,255,255);
  fill(160,220,90);
  ellipse(mouseY+5,mouseX/3,300,300);
  
  fill(160,210,230);
  rect(250, 200, 100,75);
}
