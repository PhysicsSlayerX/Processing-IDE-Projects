class Object{
 //Put the important kinematic quantities needed here
 PVector pos;                   //kinematic quantities 
 PVector vel;                   //kinematic quantities 
 PVector accel;                 //kinematic quantities
 float radius, x,y,vx,vy,ax,ay, mass, vlimit;
 //Create the object "Object" and put all the necessary control variables
 Object(float temp_radius,
        float temp_mass,
        float temp_x,
        float temp_y,
        float temp_vx,
        float temp_vy,
        float temp_ax,
        float temp_ay,
        float temp_vlimit){
  //The variables will accept inputs from the Main Program        
  radius = temp_radius;
  mass = temp_mass;
  x = temp_x;
  y = temp_y;
  vx = temp_vx;
  vy = temp_vy;
  ax = temp_ax;
  ay = temp_ay;
  vlimit = temp_vlimit;
  pos = new PVector(x, y);
  vel = new PVector(vx, vy);
  accel = new PVector(ax, ay);
 }
 //Create a function for the applied force 
 void appliedForce(PVector force){
   PVector F = PVector.div(force, mass);  //Newton's Second Law
   accel.add(F);                          //Superposition of Forces
 }
 //Create a function kinematics() to calculate for the motion of the body
 void kinematics(){
  vel.add(accel);
  pos.add(vel);
  vel.limit(vlimit);
  accel.mult(0);  //To prevent accumulation of acceleration for every tick
 }
 //Create the display function to show the motion
 void display(){
   noStroke();
   fill(255);
   ellipse(pos.x, pos.y, mass,mass);
 }
 //Create the bounds() function to specify the state of the motion at the boundaries
 void bounds(boolean solidBound){
    if(pos.x >= width/2 - radius){
      if(solidBound){
        vel.x *= -1;
      } else {
        pos.x = -width/2 + radius;
      }
    
    } else if(pos.x <= -width/2 + radius){
      if(solidBound){
        vel.x *= -1;
      } else {
        pos.x = width/2 - radius;
      }
    }
    
    if(pos.y >= height/2 - radius){
      if(solidBound){
        vel.y *=-1;
      } else {
        pos.y = -height/2 + radius;  
      }
      
    } else if(pos.y <= -height/2 + radius){
      if(solidBound){
        vel.y *=-1;
      } else {
        pos.y =  height/2 - radius;      
      }   
    } 
 }
  
}
