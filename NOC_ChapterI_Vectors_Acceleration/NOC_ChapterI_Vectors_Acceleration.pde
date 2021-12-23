Mover mover;

void setup(){
 size(500,500);
 smooth();
 mover = new Mover();
 //Static Functions
 PVector v = new PVector(1,5);
 PVector u = PVector.mult(v,2);
 PVector w = PVector.sub(v,u);
 println(w.div(3));
}

void draw(){
  
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
  
  
}
