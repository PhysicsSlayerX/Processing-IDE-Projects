Mover[] mover;
float x,y;
float tx = 0;
float ty = 10000;
float incrementX = 0.01;
float incrementY = 0.01;

void setup(){
 size(500,500);
 frameRate(60);
 background(255);
 smooth();
 mover = new Mover[50];
 for(int i = 0; i < mover.length; i++){
   mover[i] = new Mover();
 }
 
}

void draw(){
  
  //background(255);
  fill(255,25);
  rect(0,0,width,height);
  
  for (Mover mover : mover){
    
    PVector gravity = new PVector(0,0.1);
    gravity.mult(mover.mass);
    mover.applyForce(gravity);
    
    
    float noiseVarX = noise(tx);
    float noiseVarY = noise(ty);
    x = map(noiseVarX,0,1,-0.7,0.7);
    y = map(noiseVarY,0,1,-0.5,0.5);
    
    PVector wind = new PVector(x,y);
    wind.div(mover.mass);
    mover.applyForce(wind);
    println(x);
    
    tx = tx + incrementX;
    ty = ty + incrementY;
    
    /*
    if(mousePressed){
      PVector wind = new PVector(0.2,0);
      wind.div(mover.mass);
      mover.applyForce(wind);
    }*/
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
}
