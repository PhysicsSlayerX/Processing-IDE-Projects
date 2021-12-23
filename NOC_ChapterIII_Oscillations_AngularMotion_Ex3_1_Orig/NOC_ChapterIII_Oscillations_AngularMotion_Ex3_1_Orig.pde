float angle         = 0;
float aVelocity     = 0;
float aAcceleration = 0.001;

void setup(){
  size(500, 500);
 
}

void draw(){
  background(0);

  fill(255);
  stroke(255);
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(angle);
  line(-50,0,50,0);
  ellipse(50,0, 10,10);
  ellipse(-50,0,10,10);
  
  aVelocity += aAcceleration;
  angle += aVelocity;
 
}
