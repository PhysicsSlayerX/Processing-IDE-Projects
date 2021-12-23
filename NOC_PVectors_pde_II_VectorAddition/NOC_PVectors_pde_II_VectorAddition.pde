//The Nature of Code - Chapter I: Vectors
//Vector Addition

Bouncer[] b = new Bouncer[10000];

float x;
float y;

void setup(){
   //fullScreen(P2D);
   size(700,700);
}

void draw(){
  fill(255,75);
  rect(0,0,width,height);
  strokeWeight(2);
  //stroke(0);
  //fill(0);
  
  translate(width/2, height/2);
  ellipse(0,0,4,4);
  float rotation_transX = (width/2)*cos(x/32*PI)+mouseX;
  float rotation_transY = (height/2)*sin(x/32*PI)+mouseY;
  PVector mouse = new PVector(rotation_transX,rotation_transY);
  PVector center = new PVector(width/2,height/2);
  
  mouse.sub(center);
  
  line(0,0,mouse.x, mouse.y);
  ellipse(mouse.x,mouse.y,5,5);
  x++;
}
