Mover mover;
float x,y;
float tx = 0;
float ty = 10000;
float incrementX = 0.01;
float incrementY = 0.01;

void setup(){
 size(500,500);
 background(255);
 smooth();
 mover = new Mover();
 
}

void draw(){
  
  //background(255);
  fill(255,5);
  rect(0,0,width,height);
  PVector gravity = new PVector(0,0);
  mover.applyForce(gravity);
  
  float noiseVarX = noise(tx);
  float noiseVarY = noise(ty);
  x = map(noiseVarX,0,1,-2,2);
  y = map(noiseVarY,0,1,-1,1);
  PVector wind = new PVector(x,y);
  mover.applyForce(wind);
  println(x);
  
  tx = tx + incrementX;
  ty = ty + incrementY;
 
  mover.update();
  mover.checkEdges();
  mover.display();
  
//Wind based on Perlin Noise:

  

  
}
