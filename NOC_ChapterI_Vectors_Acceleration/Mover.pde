class Mover{
 PVector location;
 PVector velocity;
 PVector acceleration;  
 Mover(){
   location = new PVector(random(width),random(height));
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 void update(){ //Calculates the Math behind the Motion
   PVector mouse = new PVector(mouseX,mouseY);
   mouse.sub(location); 
   mouse.setMag(0.5);
   //acceleration = PVector.random2D();
   acceleration = mouse;
   //println(acceleration);
   velocity.add(acceleration);
   location.add(velocity); 
   velocity.limit(15);
 }
 
 void display(){ //Displays the Motion
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 16,16);
  
 }
 
 void checkEdges(){ //Spatial Boundary conditions
  if (location.x > width){
    location.x = 0;
  } else if (location.x < 0){
    location.x = width;
  }
  if (location.y > height){
    location.y = 0;
  } else if (location.y < 0){
    location.y = height;
  }
  
 }
 
}
