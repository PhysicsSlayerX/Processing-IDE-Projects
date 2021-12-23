class Mover{
  PVector location;        //Create a location vector  
  PVector velocity;        //Create a velocity vector
  PVector acceleration;    //Create an acceleration vector
  
  float mass;              //add mass
  float radius;
  
  //Define a Mover object
  Mover(float temp_m, float temp_x, float temp_y){
    location       = new PVector(temp_x, temp_y);
    velocity       = new PVector(0,0);
    acceleration   = new PVector(0,0);
    mass     = temp_m;
    radius   = mass*5;
  }
  
  void applyForce(PVector force){    //Create a function that takes a force vector
    //get a copy of force first, not to be overwritten when changes were applied
    //PVector f = force.copy();
    //Solve F/m (Newton's Second Law)
    //f.div(mass);
    //Static Version
    PVector f = PVector.div(force, mass);
    //Force Accumulation: (Note that the f now is the acceleration
    acceleration.add(f);
  }
  
  void update(){       //Create a function that updates the vectors
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);   //reset the acceleration value
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipse(location.x, location.y, radius, radius);   
  }
  
  void checkEdges(){    //Create a function that tells the limits of the simulation space
    if (location.x > width/2){
      location.x = width/2;
      velocity.x *= -1;
    } else if (location.x < -width/2){
      location.x = -width/2;
      velocity.x *= -1;
    }
    
    if (location.y > height/2){
      location.y = height/2;
      velocity.y *= -1;
    } else if (location.y < -height/2){
      location.y = -height/2;
      velocity.y *= -1;
    }
  
  }
  
}
