class Bouncer{
   PVector location;
   PVector velocity;
   PVector acceleration;
   float particle_color1,particle_color2,particle_color3;
   float sphereRadius;
   /*
   float v1 = 255;
   float v2 = 255;
   float v3 = 255;
   float nx = 1;
   float ny = 1;
   float nz = 1;
   */
   
   Bouncer (float tempX, float tempY, float tempZ, float tempXSPEED, float tempYSPEED, 
   float tempZSPEED, float particleColor1,float particleColor2,float particleColor3, float tempAccel){
     location = new PVector(tempX,tempY,tempZ);
     velocity = new PVector(tempXSPEED,tempYSPEED, tempZSPEED);
     acceleration = new PVector(tempAccel,tempAccel, tempAccel);
     particle_color1 = particleColor1;
     particle_color2 = particleColor2;
     particle_color3 = particleColor3;
     sphereRadius = 20;
     
   }
   void move(){
     location.add(velocity);
    
   }
   void bounce(){
     if ((location.x > width/2 - sphereRadius) || (location.x < -width/2 + sphereRadius)){
        velocity.x = velocity.x*-1;
     }
     if ((location.y > height/2 - sphereRadius) || (location.y < -height/2 + sphereRadius)){
        velocity.y = velocity.y*-1;   
     } 
      if ((location.z > width/2 - sphereRadius) || (location.z < -width/2 + sphereRadius)){
        velocity.z = velocity.z*-1;
     }
   }
   void display(){
     
     pushMatrix();
     stroke(0);
     strokeWeight(2);
     //directionalLight(v1, v2, v3, nx, ny, nz);
     //lights();
     noFill();
     box(width,height,width);
     translate(location.x,location.y,location.z);
     fill(0,0,0,150);
     noStroke();
     sphere(sphereRadius);
     popMatrix();
   }
   void accelerate(){
     if ((location.x > width/2 - sphereRadius) || (location.x < -width/2 + sphereRadius)){
        //acceleration.x = acceleration.x*-1;
        velocity.x = (velocity.x*-1)-acceleration.x;
     }
     if ((location.y > height/2 - sphereRadius) || (location.y < -height/2 + sphereRadius)){
        //acceleration.y = acceleration.y*-1;
        velocity.y = (velocity.y*-1)-acceleration.y;
     } 
      if ((location.z > width/2 - sphereRadius) || (location.z < -width/2 + sphereRadius)){
        //acceleration.z = acceleration.z*-1;
        velocity.z = (velocity.z*-1)-acceleration.z;
     }
   }
}
