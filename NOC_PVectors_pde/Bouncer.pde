class Bouncer{
   float x;
   float y;
   float xspeed;
   float yspeed;
   Bouncer (float tempX, float tempY, float tempXSPEED, float tempYSPEED){
     x = tempX;
     y = tempY;
     xspeed = tempXSPEED;
     yspeed = tempYSPEED;
   }
   void step(float value){
     float noiseValue1 = random(value);
     float noiseValue2 = random(value);
     x = x + xspeed*noiseValue1;
     y = y + yspeed*noiseValue2;
   
     if ((x > width) || (x < 0)){
        xspeed = xspeed*-1;
     }
     if ((y > height) || (y < 0)){
        yspeed = yspeed*-1;   
     } 
   }
   void display(){
     noStroke();
     fill(0);
     ellipse(x,y,5,5);
   }
  
}
