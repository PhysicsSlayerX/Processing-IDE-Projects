class Object{
 //Put the important kinematic quantities needed here
 PVector pos;                   //kinematic quantities 
 PVector vel;                   //kinematic quantities 
 PVector accel;                 //kinematic quantities
 PVector accelValue;
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
   PVector acc = PVector.div(force, mass);  //Newton's Second Law
   accelValue = acc;
   accel.add(acc);                          //Superposition of Forces
 }
 //Create a function kinematics() to calculate for the motion of the body
 void kinematics(){
  vel.add(accel);
  pos.add(vel);
  vel.limit(vlimit);
  accel.mult(0);  //To prevent accumulation of acceleration for every tick
 }
 //Create the display function to show the motion
 void display(float textAdjust, 
              float fontSize, 
              float textGroupInc1,
              float textGroupInc2,
              float textGroupInc3, 
              float columnPos){
   noStroke();
   fill(255,50);
   ellipse(pos.x, pos.y, radius,radius);
   fill(0,255,0);
   pushMatrix();
     translate(-width/2, height/2);
     scale(1,-1);
     textSize(fontSize);
     text("pos = " + "(" + round(pos.x)+ "," + round(pos.y) +")" ,columnPos, textGroupInc1 + textAdjust);
     text("vel = " + "(" + round(vel.x)+ "," + round(vel.y)  +")",columnPos, textGroupInc2+ textAdjust);
     text("accel = " + "(" + (accelValue.x)+ "," + (accelValue.y) +")" , columnPos, textGroupInc3+ textAdjust);
   popMatrix();
   
 }
 //Create the bounds() function to specify the state of the motion at the boundaries
 void bounds(boolean solidBound){
    if(pos.x > width/2 - radius/2){
      if(solidBound){
        vel.x *= -1;
        pos.x = width/2 - radius/2;
      } else {
        pos.x = -width/2 + radius/2;
      }
    
    } else if(pos.x < -width/2 + radius/2){
      if(solidBound){
        vel.x *= -1;
        pos.x = -width/2 + radius/2;
      } else {
        pos.x = width/2 - radius/2;
      }
    }
    
    if(pos.y > height/2 - radius/2){
      if(solidBound){
        vel.y *=-1;
        pos.y = height/2 - radius/2; 
      } else {
        pos.y = -height/2 + radius/2;  
      }
      
    } else if(pos.y < -height/2 + radius/2){
      if(solidBound){
        vel.y *=-1;
        pos.y = -height/2 + radius/2; 
      } else {
        pos.y =  height/2 - radius/2;      
      }   
    } 
 }
 boolean isPocket(Pockets p_){   //Defines the boundaries of the pocket
      if(p_.square && pos.x > p_.x &&                        //This condition tells if the object
         pos.x < p_.x + p_.w &&                   //is within the domain of the pocket.
         pos.y > p_.y &&                          //you can access the properties of the 
         pos.y < p_.y + p_.h){                    //Pockets class since we declare it
           return true;                           // (x,y,w,h) in the Object class.
         } 
      else if(p_.circle && pos.x > p_.x - 0.75*sqrt(pow(0.5*p_.w,2) + pow(0.5*p_.h,2)) &&                        //This condition tells if the object
               pos.x < p_.x + 0.75*sqrt(pow(0.5*p_.w,2) + pow(0.5*p_.h,2)) &&                   //is within the domain of the pocket.
               pos.y > p_.y - 0.75*sqrt(pow(0.5*p_.w,2) + pow(0.5*p_.h,2)) &&                          //you can access the properties of the 
               pos.y < p_.y + 0.75*sqrt(pow(0.5*p_.w,2) + pow(0.5*p_.h,2))){                    //Pockets class since we declare it 
                                                                                                //we used the pythagorean theorem here!         
           return true;
         }
      else if(p_.rectangle && pos.x > p_.x &&                        //This condition tells if the object
               pos.x < p_.x + 2*p_.w &&                   //is within the domain of the pocket.
               pos.y > p_.y &&                          //you can access the properties of the 
               pos.y < p_.y + p_.h){                    //Pockets class since we declare it
                                                        //The rectangle shape has a 2:1 width-height ratio
           return true;
         }
      else { 
          return false;
         }
}
 void friction(float frictionMag){              //this is accessible as a method of the Object class
      PVector friction = vel.copy();            //get the velocity vector
      friction.normalize();                     //get the normalized vector for direction
      friction.mult(-1);                        //friction opposes the direction of motion
      friction.mult(frictionMag);               //Put the magnitude of friction
      appliedForce(friction);
    }
 
}
