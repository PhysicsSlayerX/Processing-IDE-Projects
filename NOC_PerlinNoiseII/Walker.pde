class Walker{
  float x,y;
  float tx,ty;
  float incrementX, incrementY;
  
  Walker(float tempTx, float tempTy, float tempIncX, float tempIncY){
    tx = tempTx;
    ty = tempTy;
    incrementX = tempIncX;
    incrementY = tempIncY;
  }
  void display(){
    
    fill(255,255,0);
    noStroke();
    ellipse(x,y,10,10);
  }
  void step(){
    float noiseVarX = noise(tx);
    float noiseVarY = noise(ty);
    x = map(noiseVarX,0,1,0,width);
    y = map(noiseVarY,0,1,0,height);
    
    tx = tx + incrementX;
    ty = ty + incrementY;
    
    incrementX = map(noiseVarX, 0,1, 0, 0.009);
    incrementY = map(noiseVarY, 0,1, 0, 0.009);
    
  }
}
