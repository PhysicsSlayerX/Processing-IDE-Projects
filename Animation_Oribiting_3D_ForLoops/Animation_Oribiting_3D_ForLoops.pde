float x, y, z, x1, y1, z1,rev,rev2,adjust,x2,y2,z2;

void setup() {
  size(700, 700, P3D);
  surface.setResizable(true);
  frameRate(120);
  //background(0);
  noStroke();
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  x= width/2;
  y = height/2;
  z= 0;
  x1= 250;
  y1= 500;
  z1=0;
  float g = x + y;
  println(g);
}
void draw() {
  background(0);
  translate(x,y,z);
  //boundsCircle();
  rev2++;
  //rotateX(radians(map(mouseX,0,width/2,0,360)));
  rotateX(cos(radians(rev2)));
  //rotateX(atan(radians(rev2)));
  rotateY(sin(radians(rev2)));
  rotateZ(cos(radians(rev2)));
  
  scale(atan(radians(rev2)));
  //fill(map(250*sin(rev2/17),20,255,100,255),map(255*cos(rev2/27),20,255,100,255),map(255*sin(rev2/35),20,255,100,255));
  //fill(90*sin(rev2/17) + 150 ,90*cos(rev2/27) + 150, 90*sin(rev2/35)+150);
  layer7();
  layer5();
  layer3();
  layer1();
  layer0();
  layer2();
  layer4();
  layer6();
  layer8();
}

void boxArrays(){
  for (int i = -width/2; i<width/2; i+=300){
    for(int j = -height/2; j<height/2; j+=300){
      //rotateZ((radians(rev2/50)));
      pushMatrix();
      translate(i,j,z);
      //rotateX((radians(rev2*10)));
      rotateY((radians(rev2*10)));
      rotateZ((radians(rev2*10)));
      //stroke(255,255);
      fill(255,175);
      box(50);
      popMatrix();
    }
  }
}
void ellipseArrays(){
  for (int i = -width/2; i<width/2; i+=300){
    for(int j = -height/2; j<height/2; j+=300){
      //rotateZ((radians(rev2/50)));
      pushMatrix();
      translate(i,j,z);
      //rotateX(sin(radians(rev2*10)));
      //rotateY(cos(radians(rev2*10)));
      //rotateZ(sin(radians(rev2*10)));
      lights();
      //stroke(255,100);
      fill(255,0,0);
      sphere(35);
          pushMatrix();
          translate(50*cos(radians(rev2*10)),50*sin(radians(rev2*10)),z);
          //rotateX(sin(radians(rev2*10)));
          //rotateY(cos(radians(rev2*10)));
          //rotateZ(sin(radians(rev2*10)));
          lights();
          //stroke(255,100);
          fill(0,255,0);
          sphere(15);
          popMatrix();
          pushMatrix();
          translate(70*sin(radians(rev2*10)),70*cos(radians(rev2*10)),z);
          //rotateX(sin(radians(rev2*10)));
          //rotateY(cos(radians(rev2*10)));
          //rotateZ(sin(radians(rev2*10)));
          lights();
          //stroke(255,100);
          fill(0,0,255);
          sphere(15);
          popMatrix();
      popMatrix();
    }
  }
}


void layer0(){
  //int zA = valueZ(z);
  pushMatrix();
  translate(0,0,z);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer1(){
  pushMatrix();
  translate(0,0,z+100);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}

void layer2(){
  pushMatrix();
  translate(0,0,z-100);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer3(){
  pushMatrix();
  translate(0,0,z+200);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer4(){
  pushMatrix();
  translate(0,0,z-200);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer5(){
  pushMatrix();
  translate(0,0,z+300);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer6(){
  pushMatrix();
  translate(0,0,z-300);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer7(){
  pushMatrix();
  translate(0,0,z+400);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
void layer8(){
  pushMatrix();
  translate(0,0,z-400);
  boxArrays();
  ellipseArrays();
  popMatrix();
  
}
/*
int valueZ(int dz){
  //for(dz = 0; dz <= 1000; dz+=200){
  while (dz <= 1000){
    dz+=200;
  }
  return dz;
}*/




 
