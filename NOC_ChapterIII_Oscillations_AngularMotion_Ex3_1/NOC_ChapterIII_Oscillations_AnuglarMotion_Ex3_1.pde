float angle         = 0;
float aVelocity     = 0;
float aAcceleration = 0.001;

void setup(){
  size(500, 500);
  background(0);
}

void draw(){
  //rectMode(CENTER);
  translate(width/2, height/2);
  fill(0, 10);    //persistence of vision effect
  rect(-width/2, -height/2, width, height);
  
  fill(255,50);
  stroke(255,50);
  
  rotate(angle);
  line(-250*cos(angle),0,250*cos(angle),0);
  ellipse(250*cos(angle),0, 10,10);
  ellipse(-250*cos(angle),0,10,10);
  
  aVelocity += aAcceleration;
  angle += aVelocity;
  rect(500,500,0,0);
}
