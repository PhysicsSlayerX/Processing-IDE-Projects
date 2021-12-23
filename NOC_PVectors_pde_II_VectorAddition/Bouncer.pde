class Bouncer{
   PVector location;
   PVector velocity;
   float particle_color1,particle_color2,particle_color3;
   
   Bouncer (float tempX, float tempY, float tempXSPEED, float tempYSPEED, 
   float particleColor1,float particleColor2,float particleColor3){
     location = new PVector(tempX,tempY);
     velocity = new PVector(tempXSPEED,tempYSPEED);
     particle_color1 = particleColor1;
     particle_color2 = particleColor2;
     particle_color3 = particleColor3;
     
   }
   void move(){
     location.add(velocity);
    
   }
   void bounce(){
     if ((location.x > width/2) || (location.x < -width/2)){
        velocity.x = velocity.x*-1;
     }
     if ((location.y > height/2) || (location.y < -height/2)){
        velocity.y = velocity.y*-1;   
     } 
   }
   void display(){
     noStroke();
     fill(particle_color1,particle_color2,particle_color3);
     ellipse(location.x,location.y,5,5);
   }
  
}
