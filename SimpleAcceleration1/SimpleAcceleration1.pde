
float x;
float y;
float t = 1;
float a = 1.1;

void setup(){
  size(1920, 1080, P2D);
  frameRate(60);
  smooth();
  strokeWeight(0);
  background(255);
}

void draw(){
  translate(0,height/2);
  scale(1, -1);
  x += a*pow(t,2);
  t +=0.2;
  fill(0);
  ellipse(x,y, 10,10);

}
