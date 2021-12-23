//Conditional Statement
//if(______){__________}


void setup(){
  size(1000,700);
  
}

void draw(){
  background(0);
  stroke(255);
  fill(128);
  
  if(mousePressed){
     rect(250,200,100,100);
  } else {
     ellipse(250,250, 100,100);
  }
}
