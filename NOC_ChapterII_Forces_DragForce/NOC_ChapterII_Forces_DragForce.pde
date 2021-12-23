//Drag Forces

Motion[] ball;
Liquid l,l2;
float vX,vY, rD, Mass, limit, theta;
float density = 1; //air density
float windDirection;

void setup(){
  //fullScreen(P2D);
  size(700,700,P2D);
  //background(0);
  smooth();
  ball = new Motion[3000];
    
  for(int i = 0; i < ball.length; i++){
    vX = random(-5,5);
    vY = random(-5,5);
    Mass = random(1,2);
    rD = Mass*2;
    limit = 15;
    ball[i] = new Motion(vX, vY, rD, Mass, limit);
  }
  //l = new Liquid(-width/2, 0, width, height/2, 0.1,100,100,255);
  //l2 = new Liquid(-width/2,height/4,width, height/2, 0.1,255,100,100); 
  l = new Liquid(-width/2, 0, width/4, height/2, 0.1,100,100,255);
  l2 = new Liquid(width/4,0,width/2, height/2, 0.1,255,100,100); 

}

void draw(){
  
  translate(width/2,height/2);
  fill(0,50);
  //float cForceX = cos(radians(theta));
  //float cForceY = sin(radians(theta));
  rect(-width/2, -height/2, width, height);
  l.display();
  l2.display();
  for(int i = 0; i < ball.length; i++){
    PVector gravity = new PVector(0,0.1);
    gravity.mult(ball[i].mass);
    ball[i].applyForce(gravity);
    
    if(ball[i].isLiquid1(l)){
      ball[i].drag1(l, density);
    }
    if(ball[i].isLiquid2(l2)){
      ball[i].drag2(l2, density+1);
    }
    
    if(mousePressed){
      if(ball[i].location.y <= 0){
        windDirection = map(mouseX, 0, width/4, -0.1,0.1);             
        PVector wind = new PVector(windDirection,0);
        ball[i].applyForce(wind);
      }
    }
    
    
    if(ball[i].location.y <=0 && 
      ball[i].location.x >= 0){
      PVector friction = ball[i].velocity.copy();
      friction.normalize();
      friction.mult(-1);
      
      float mu = 0.0; //coeff of static friction
      float normalForce = 1;
      float frictionMag = mu*normalForce;
      friction.mult(frictionMag);
      ball[i].applyForce(friction);
      
    } else {
      
      PVector friction = ball[i].velocity.copy();
      friction.normalize();
      friction.mult(-1);
      
      float mu = 0.0; //coeff of static friction
      float normalForce = 1;
      float frictionMag = mu*normalForce;
      friction.mult(frictionMag);
      ball[i].applyForce(friction);
      
    }
    
    ball[i].calc();
    ball[i].bounds();
    ball[i].display();
  }
  //theta++;
  
  
}
