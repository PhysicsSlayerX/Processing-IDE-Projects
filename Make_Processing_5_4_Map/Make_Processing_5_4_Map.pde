float x; //current x
float y; //current y
float px; //previous x
float py; //previous y
float easing = 0.05;

void setup() {
  size(480, 480);
  smooth();
  strokeWeight(12);
}
/*
void draw() {
  background(204);
  stroke(255);
  line(120,60,mouseX,mouseY); //White line
  stroke(0);
  float mx = mouseX/2 + 60;
  line(120,60,mx, mouseY); //black lines
  
}
*/
//map() function
void draw(){
 background(204);
 stroke(255);
 line(120,60, mouseX, mouseY); //White line
 stroke(0);
 float mx = map(mouseX,0,width,60,180);
 float my = map(mouseY,0,height,60,180);
 line(120,60,mx,my); //Black line
}
