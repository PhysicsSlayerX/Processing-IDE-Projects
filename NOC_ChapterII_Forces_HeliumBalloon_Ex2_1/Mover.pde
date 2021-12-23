class Mover{
 PVector location;
 PVector velocity;
 PVector acceleration; 
 Mover(){
   location = new PVector(random(width),random(height));
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);

 }
 
 
 void applyForce(PVector force){
  
   //force.sub(location); 
   //force.setMag(0.5);
   //acceleration = PVector.random2D();
   acceleration.add(force);
   
 }
 void update(){

   //println(acceleration);
   velocity.add(acceleration);
   location.add(velocity); 
   velocity.limit(15);
   acceleration.mult(0);
 }
 
 void display(){
  stroke(0);
  noStroke();
  fill(175);
  ellipse(location.x, location.y, 50,50);
  
 }
 
 void checkEdges(){
  if (location.x+25 >= width || location.x-25 <= 0){
    velocity.x = velocity.x*-1;
  }
  if (location.y+25 >= height || location.y-25 <= 0){
    velocity.y = velocity.y*-1;
  }
  
 }
 
}
