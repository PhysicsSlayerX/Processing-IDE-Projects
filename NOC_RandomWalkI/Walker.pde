Walker w;
int i,j;
public void settings(){
 size(1280,720,P3D); 
}

void setup(){
  w = new Walker();
  background(0);
  
}

void draw(){
  //background(0);
  
  //pushMatrix();
  translate(width/2, height/2,0);
  //rotateX(radians(map(mouseY, -width/2,width/2, 0,360)));
  //rotateY(radians(map(mouseX, height/2,-height/2, 0,360)));
  //rotateY(radians(i));
  w.step();
  w.display();
  //box(100);
  //popMatrix();
  
  //pushMatrix();
  //translate(width/2, height/2,0);
  //rotateX(radians(map(mouseY, -width/2,width/2, 0,360)));
  //rotateY(radians(map(mouseX, height/2,-height/2, 0,360)));
  //rotateY(radians(j));
  //noFill();
  //box(300);
  //popMatrix();
  
  i++;
  j--;
}
