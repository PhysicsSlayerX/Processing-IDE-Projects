Mover mover;

void setup(){
 size(200,200);
 smooth();
 mover = new Mover();
  
  
}

void draw(){
  
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
  
  
}
