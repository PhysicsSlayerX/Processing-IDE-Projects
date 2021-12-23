float x,y,z,x1,y1,z1,rev,rev2,adjust,x2,y2,z2;

void setup(){
 size(1920,1080,P3D);
 frameRate(30);
 //background(0);
 noStroke();
 smooth();
 rectMode(CENTER);
 x=width/2;
 y=height/2;
 z = 0;
 x1 =250;
 y1 = 500;
 z1 = 0;
}
void draw(){
  background(0);
  translate(x,y,z);
  barControl();
  rev2++;
  //rotateX(radians(rev2/4));
  //rotateY(radians(rev2/4));
  //scale(cos(radians(rev2/4)));
  rotateX(radians(0));
  rotateY(radians(0));
  scale(cos(radians(map(mouseY,0,height/2,0,360)/2)));
  boxEs();
  Spheres();
}

void boxEs(){
 pushMatrix();
 rev++;
 translate(x1*cos(radians(rev)), y1*sin(radians(rev)),z1-100);
 rotateZ(radians(rev));
 lights();
 fill(93,57,210);
 box(100);
   pushMatrix();
   translate((x1-100)*cos(radians(rev*3)),(y1-100)*sin(radians(rev*3)),z1-500);
   rotateZ(radians(rev*3));
   lights();
   fill(193,57,210);
   box(50);
     pushMatrix();
     translate((x1-100)*cos(radians(rev*3)),(y1-100)*sin(radians(rev*3)),z1-750);
     rotateZ(radians(rev*3));
     lights();
     fill(193,157,210);
     box(25);
     popMatrix();
   popMatrix();
 popMatrix();
}

void Spheres(){
 pushMatrix();
 rev++;
 translate(x1*sin(radians(rev)), y1*cos(radians(rev)),z1-100);
 rotateZ(radians(rev));
 lights();
 fill(50,157,145);
 sphere(100);
   pushMatrix();
   translate((x1-100)*sin(radians(rev*3)),(y1-100)*cos(radians(rev*3)),z1-500);
   rotateZ(radians(rev*3));
   lights();
   fill(220,57,210);
   sphere(50);
     pushMatrix();
     translate((x1-100)*sin(radians(rev*3)),(y1-100)*cos(radians(rev*3)),z1-750);
     rotateZ(radians(rev*3));
     lights();
     fill(163,230,10);
     sphere(25);
     popMatrix();
   popMatrix();
 popMatrix(); 
}

void barControl(){
 barGeom();
 //ellipse(0,0,200,200);
 if((mouseX >= width/2.8-100 && mouseY < height/2) &&(mouseX < width/2.8 + 100 && mouseY >= 0)){
   adjust = map(mouseY,0,height/2,0,250);
 }
 pushMatrix();
 translate(width/3.1, -250+adjust,z1);
 cursorShape();
 popMatrix();
 
}
void barGeom(){
 fill(150);
 rect(width/2.8,0,50,500);
 
}
void cursorShape(){
  fill(255,0,0);
  pushMatrix();
  translate(x2,y2,z2);
  scale(1.2);
  beginShape();
  vertex(0,-20);
  vertex(50,-20);
  vertex(70,0);
  vertex(50,20);
  vertex(0,20);
  endShape(CLOSE);
  popMatrix();
}
