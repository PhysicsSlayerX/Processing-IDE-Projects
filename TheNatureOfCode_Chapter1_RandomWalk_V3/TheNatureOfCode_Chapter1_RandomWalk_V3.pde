Walker w;

void setup(){
 size(700,700);
 smooth();
 frameRate(120);
 background(0);
 w = new Walker();
}

void draw(){
  w.step();
  w.display();
}
