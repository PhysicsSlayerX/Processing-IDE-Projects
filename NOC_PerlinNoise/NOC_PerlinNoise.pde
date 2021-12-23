float alpha = 0.2;
float beta = 0.5;

void setup(){
  size(600,400);
  //frameRate(120);
}

void draw(){
  //background(0);
  fill(255);
  
  //float x = random(width);
  float x = noise(alpha);
  float y = noise(beta);
  x = map(x,0,1,0, width/2);
  y = map(y,0,1,0,height/2);
  ellipse(x,y, 40,40);
  alpha = alpha + 0.01;
  beta = beta + 0.01;
}

 
