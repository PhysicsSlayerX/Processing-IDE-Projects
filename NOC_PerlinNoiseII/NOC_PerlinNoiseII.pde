//Example I.7 - The Nature of Code - Perlin Noise and Random Walk

Walker w, w2;

float tx = 0;
float ty = 10000;
float incrementX = 0.01;
float incrementY = 0.01;

void setup(){
  frameRate(60);
  size(720,720);
  w = new Walker(tx,ty,incrementX, incrementY);
  w2 = new Walker(ty/2,1.5*ty,incrementX, incrementY);
  //background(0);
}

void draw(){
  fill(0,10);
  rect(0,0,width,height);
  w.step();
  w2.step();
  w.display();
  w2.display();
}
