class Motion{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass, radius;
  float x,y,vx,vy;
  float vLimit;
  
  Motion(float vxT, float vyT, float rT, 
  float massT, float vLimitT){
    //mass = random(1,2);
    //radius = mass*20;
    mass = massT;
    radius = rT;
    vx = vxT;
    vy = vyT;
    vLimit = vLimitT;
    x = random(-width/2 + radius, width/2 - radius);
    //y = random(-height/2 + radius,height/2 - radius);
    y = -height/2 +100;
    //x = 0;
    //y = 0;
    location = new PVector(x,y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0,0);  
    
  }
  
  void applyForce(PVector force){
    
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  
  void calc(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(vLimit);
    acceleration.mult(0);
  }
  void bounds(){
    if(location.x >= width/2 - radius){
      //velocity.x *= -1;
      location.x = -width/2 + radius;
    } else if(location.x <= -width/2 + radius){
      //velocity.x *= -1;
      location.x = width/2 - radius;
    }
    
    if(location.y >= height/2 - radius){
      //velocity.y *=-1;
      location.y = -height/2 + radius;
      
    } else if(location.y <= -height/2 + radius){
      //velocity.y *=-1;
      location.y =  height/2 - radius;
      
    }
  }
  void display(){
    fill(255,200,50);
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
  /*
    A code block to check if the location of the object is inside the liquid
    This code tells the boundaries of the drag force application
  */
  boolean isLiquid1(Liquid l_){
    if(location.x > l_.x &&
       location.x < l_.x + l_.w &&
       location.y > l_.y &&
       location.y < l_.y + l_.h){
         return true;
       } else {
         
         return false;
       }
  }
  boolean isLiquid2(Liquid l_){
    if(location.x > l_.x &&
       location.x < l_.x + l_.w &&
       location.y > l_.y &&
       location.y < l_.y + l_.h){
         return true;
       } else {
         
         return false;
       }
  }
  
  /* 
    Drag Force Calculation:
    
    The magnitude of the speed then squared, times the air density,
    times the drag coefficient will determine the magnitude of 
    the drag force.
    
    the copy() method, normalize() and mult(-1) is for the unit vector 
    associated with velocity then applied to drag force, since the drag
    force is directed opposite relative to the velocity vector. 
    
  */
  void drag1(Liquid l_, float density_){
    
    float speed = velocity.mag();
    float density = density_; 
    float dragMag = l_.c*pow(speed,2)*density;
    
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);
    applyForce(drag);
    
    
    
    
  }
  void drag2(Liquid l_, float density_){
    
    float speed = velocity.mag();
    float density = density_; 
    float dragMag = l_.c*pow(speed,2)*density;
    
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);
    applyForce(drag);
    
    
    
    
  }
}
