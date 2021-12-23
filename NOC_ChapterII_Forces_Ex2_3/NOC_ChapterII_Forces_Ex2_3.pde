Mover[] mover;
float x,y;
float tx = 0;
float ty = 10000;
float incrementX = 0.01;
float incrementY = 0.01;

float distanceX, distanceY, distFromCenterX, distFromCenterY,dX,dY;
float flipSignX = 1;
float flipSignY = 1;

void setup(){
 size(500,500);
 frameRate(60);
 background(255);
 smooth();
 mover = new Mover[100];
 for(int i = 0; i < mover.length; i++){
   mover[i] = new Mover();
 }
 
}

void draw(){
  
  //background(255);
  fill(255,5);
  rect(0,0,width,height);
  
  for (Mover mover : mover){
    
    PVector gravity = new PVector(0,0);
    gravity.mult(mover.distance);
    mover.applyForce(gravity);
    
    distanceX = dist(width/2-mover.radiusBall/2, 0, mover.location.x,0);
    distanceY = dist(0, height/2-mover.radiusBall/2, 0,mover.location.y);
    
    if(mover.location.x <= width/2){
      flipSignX = -1;
    } else {
      flipSignX = 1;
    }
    if(mover.location.y <= height/2){
      flipSignY = -1;
    } else {
      flipSignY = 1;
    }
    dX = map(distanceX*flipSignX, -width/2, width/2, 1, -1);
    dY = map(distanceY*flipSignY, -height/2, height/2,1, -1);
    PVector wind = new PVector(dX*(distanceX/mover.location.x),dY*(distanceY/mover.location.y));
    mover.applyForce(wind);
    tx = tx + incrementX;
    ty = ty + incrementY;
    
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
}
