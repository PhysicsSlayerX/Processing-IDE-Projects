class Mover{
 PVector location;
 PVector velocity;
 PVector acceleration; 
 
 float mass;
 float colorBall;
 float radiusBall;
 Mover(){
   mass = 1;
   radiusBall = mass*20;
   //location = new PVector(random(radiusBall, width-radiusBall),random(radiusBall,height-radiusBall));
   location = new PVector(width/2,0);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   colorBall = random(150,255);
   
 }
 
 
 void applyForce(PVector force){
  
   /*
     The static function PVector was used for the operation in PVectors.
     We can't pass our normal operations to PVectors, so instead of
     directly dividing the mass to the PVector, we used a method inside
     the PVector, the PVector.div, then pass the arguments force and mass.
   */
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
   
 }
 void update(){

   /*
     The method in simulating motion is by controlling the three kinematic 
     quantities: The displacement, velocity, and acceleration vectors. Since these
     are all vectors, we can use PVector.add method to do vector additions. 
     location.add(velocity) shows change in position. (dx/dt)
     velocity.add(acceleration) shows change in velocity (dv/dt)
   */
   velocity.add(acceleration);
   location.add(velocity); 
   velocity.limit(500);
   acceleration.mult(0);
 }
 
 void display(){
  stroke(0);
  noStroke();
  fill(colorBall,0,0, 100);
  ellipse(location.x, location.y, radiusBall,radiusBall);
  
 }
 
 void checkEdges(){
  //Determine the boundaries of the system. This time, it's bouncing.
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
