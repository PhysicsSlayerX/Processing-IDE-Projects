void setup(){
  size(1000,700);
  background(10,80,100);
}

void draw(){
  if(mousePressed){
    background(10,80,100);
    if(mouseY > mouseX){
      stroke(46);
      fill(mouseX, mouseX,164);
      ellipse(mouseY,mouseX, 40,40);
    }
  }
  stroke(255,255,255);
  fill(mouseY,78,mouseY);
  ellipse(mouseX, mouseY,10,10);
  
  fill(255,255,255);
  if(mouseX > mouseY && mousePressed){
    stroke(0);
    fill(34,45,67);
    rect(mouseX, mouseY, 30,30);
  } else {
    
    stroke(123,233,33);
    fill(176, 225, 62);
    ellipse(mouseX,mouseY, mouseY/10, mouseX/11);
  }
}
