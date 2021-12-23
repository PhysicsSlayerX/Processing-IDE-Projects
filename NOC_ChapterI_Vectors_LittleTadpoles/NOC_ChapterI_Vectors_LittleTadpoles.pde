//The Nature of Code - Chapter I. Vectors
// bouncing ball without vectors

float x = width;
float y = height;
float xspeed = 5;
float yspeed = 5;
float value = 2;
Bouncer[] b = new Bouncer[1000];

void setup(){
   fullScreen();
   //size(700,700);
   background(255);
   for(int i = 0; i < b.length; i++){
      b[i] = new Bouncer(random(0,x), random(0,y),random(xspeed),random(yspeed));
   }
}

void draw(){
  fill(255,75);
  rect(0,0,width, height);
  for(int i = 0; i < b.length; i++){
      b[i].step(value);
      b[i].display();
   }
  
}
