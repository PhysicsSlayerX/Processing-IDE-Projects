Walker w;
public void settings(){
 size(720,720,P3D); 
}

void setup(){
  w = new Walker();
  background(0);
  
}

void draw(){
  
  translate(width/2, height/2);

  w.step();
  w.display();

}
