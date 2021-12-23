/*  

    A basic vector graphing program, by Francis S. Dela Cruz.
    It aims to be a practice activity for Processing IDE.
    More functions and classes are to be added.
    
*/

Grids g;
float spacing = 50;
float scaling = 1;
float addAxisLength = 3000;

float angle1;
float angle2;

PVector lineVector;
PVector lineVector2;
PVector lineVector3;

float gridLengthX;
float gridLengthY;

void setup(){
  size(1000,1000,P2D);
  surface.setResizable(true);
  float gridLengthX = width+addAxisLength;
  float gridLengthY = height+addAxisLength;
  g = new Grids(-gridLengthX,-gridLengthY,spacing);
  //background(0);
  /*lineVector = new PVector(10*sin(radians(50)),10*cos(radians(50)));
  lineVector2 = new PVector(-6*cos(radians(85)),-6*sin(radians(85)));
  lineVector3 = new PVector(lineVector.x+lineVector2.x,lineVector.y+lineVector2.y);
  */
}

void draw(){
  background(0);
  /*
   float mouseXmap = map(mouseX, 0,width, -gridLengthX,gridLengthX);
   float mouseYmap = map(mouseY, 0, height, -gridLengthY,gridLengthY);
   translationCS = new PVector(0,0);
   translationCS.x = mouseXmap;
   translationCS.y = mouseYmap;
  */
  
  lineVector = new PVector(10*sin(radians(angle1)),10*cos(radians(angle1)));
  lineVector2 = new PVector(-6*cos(radians(angle2)),-6*sin(radians(angle2)));
  lineVector3 = new PVector(lineVector.x+lineVector2.x,lineVector.y+lineVector2.y);
  translate(width/2,height/2);
  //scale(scaling,scaling);
  scale(scaling,scaling);
  fill(255,0,0);
  textSize(40);
  text("A", (lineVector.x*spacing+20)*scaling, -(lineVector.y*spacing+20)*scaling);
  fill(0,255,0);
  textSize(40);
  text("B", (lineVector2.x*spacing-40)*scaling, -(lineVector2.y*spacing+20)*scaling);
  fill(0,255,255);
  textSize(40);
  text("R", (lineVector3.x*spacing+20)*scaling, -(lineVector3.y*spacing-60)*scaling);
  
  scale(scaling,-scaling);
  pushMatrix();
  strokeWeight(10);
  stroke(255,0,0);
  line(0, 0, lineVector.x*spacing,lineVector.y*spacing);
  
  stroke(0,255,0);
  line(0, 0, lineVector2.x*spacing,lineVector2.y*spacing);
  
  stroke(0,255,255);
  line(0, 0, lineVector3.x*spacing,lineVector3.y*spacing);
  
  stroke(0,255,0);
  line(lineVector3.x*spacing, lineVector3.y*spacing, lineVector.x*spacing,lineVector.y*spacing);
  
  stroke(255,0,0);
  line(lineVector2.x*spacing,lineVector2.y*spacing,lineVector3.x*spacing, lineVector3.y*spacing);
  
  popMatrix();
  

  g.textDisp();
  g.gridDisplay();
  
  angle1++;
  angle2++;

}

void mouseWheel(MouseEvent event){
    float e = event.getCount();
    scaling += e*0.06;
    println(scaling);
    if(scaling <= 0.05){
      scaling = 0.1;
    }
}
void mouseDragged(){
   
    
}
