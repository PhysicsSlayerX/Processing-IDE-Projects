class Mover{
 PVector location;
 PVector velocity;
 PVector acceleration; 
 
 float mass, distance; //distance from the center = mass
 float colorBall;
 float radiusBall;
 Mover(){
   
   location = new PVector(random(radiusBall, width-radiusBall),random(radiusBall,height-radiusBall));
   //location = new PVector(width, height-40);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   colorBall = random(150,255);
   mass = random(1,2);
   radiusBall = mass*20;
   
 }
 
 
 void applyForce(PVector force){
  
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
   
 }
 void update(){

   velocity.add(acceleration);
   location.add(velocity); 
   velocity.limit(5);
   acceleration.mult(0);
 }
 
 void display(){
  stroke(0);
  noStroke();
  fill(colorBall,0,0, 100);
  ellipse(location.x, location.y, radiusBall,radiusBall);
  
 }
 
 void checkEdges(){
  if (location.x+radiusBall >= width || location.x-radiusBall <= 0){
    velocity.x = velocity.x*-1;
  }
  if (location.x+radiusBall >= width){
    location.x = width-radiusBall;
  }
  if (location.x-radiusBall <= 0){
    location.x = radiusBall;
  }
  if (location.y+radiusBall >= height || location.y-radiusBall <= 0){
    velocity.y = velocity.y*-1;
  }
  if(location.y+radiusBall >= height){
    location.y = height - radiusBall;
  }
  if(location.y-radiusBall <= 0){
    location.y = radiusBall;
  }
  
 }
 
}
