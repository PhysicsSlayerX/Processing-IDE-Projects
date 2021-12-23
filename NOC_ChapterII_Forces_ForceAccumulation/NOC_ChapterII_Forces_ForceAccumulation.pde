Mover mover;

void setup(){
 size(500,500);
 background(255);
 smooth();
 mover = new Mover();
}

void draw(){
  
  //background(255);
  fill(255,5);
  rect(0,0,width,height);
  PVector gravity = new PVector(0,0.1);
  mover.applyForce(gravity);
  
  mover.update();
  mover.checkEdges();
  mover.display();
  
  if(mousePressed){
   PVector wind = new PVector(0.2,0); 
   mover.applyForce(wind);
  } else {
   PVector wind = new PVector(0,0);
   mover.applyForce(wind);
  }
  
}
