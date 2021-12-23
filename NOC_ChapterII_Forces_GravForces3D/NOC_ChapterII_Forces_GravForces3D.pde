Motion[] ball;
Liquid l,l2;
Attractor a, a2, a3;
float vX,vY, rD, Mass, limit, theta;
float density = 1;
float windDirection;

void setup(){
  //fullScreen(P2D);
  size(900,900,P2D);
  background(0);
  smooth();
  ball = new Motion[3000];
    
  for(int i = 0; i < ball.length; i++){
    vX = random(-5,5);
    vY = random(-5,5);
    Mass = random(1,20);
    rD = 2;//Mass*1.5;
    limit = 10;
    ball[i] = new Motion(vX, vY, rD, Mass, limit);
  }
  a = new Attractor();
  a2 = new Attractor();
  a3 = new Attractor();
  //l = new Liquid(-width/2, 0, width, height/2, 0.1,100,100,255);
  //l2 = new Liquid(-width/2,height/4,width, height/2, 0.1,255,100,100); 
  l = new Liquid(-width/2, 0, width/4, height/2, 0.1,100,100,255);
  l2 = new Liquid(width/4,0,width/2, height/2, 0.1,255,100,100); 

}

void draw(){
  
  translate(width/2,height/2);
  fill(0,15);
  float cForceX = 500*cos(radians(theta));
  float cForceY = 100*sin(radians(theta));
  rect(-width/2, -height/2, width, height);
  //l.display();
  //l2.display();
  //a.display();
  //a2.display();
  //a3.display();
  if(true){
    float mouseMappedX = map(mouseX, 0, width, -width/2, width/2); 
    float mouseMappedY = map(mouseY, 0, height, -height/2, height/2); 
    a3.location = new PVector(ball[0].location.x, ball[int(random(ball.length))].location.y);
    a2.location = new PVector(cForceX, cForceY);
    a.location = new PVector(mouseMappedX, mouseMappedY);
  }
  for(int i = 0; i < ball.length; i++){
    PVector force = a.attract(ball[i]);
    ball[i].applyForce(force);
    PVector force1 = a2.attract(ball[i]);
    ball[i].applyForce(force1);
    PVector force2 = a3.attract(ball[i]);
    ball[i].applyForce(force2);
    
    
    PVector gravity = new PVector(0,-0.1);
    gravity.mult(ball[i].mass);
    ball[i].applyForce(gravity);
    
    if(ball[i].isLiquid1(l)){
      ball[i].drag1(l, density);
    }
    if(ball[i].isLiquid2(l2)){
      ball[i].drag2(l2, density+1);
    }
    /*
    if(mousePressed){
      if(ball[i].location.y <= 0){
        windDirection = map(cForceX, 0, width/4, -0.1,0.1);             
        PVector wind = new PVector(windDirection,0);
        ball[i].applyForce(wind);
      }
    }
    */
    
    
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
  theta++;
  
  
}

    
