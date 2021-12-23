//The Nature of Code - Chapter I: Vectors
//Vector Addition
//Magnitude and Normalization

Bouncer[] b = new Bouncer[2];

float x;
float y;
float scaling=1;

void setup(){
   //fullScreen(P2D);
   size(700,700,P3D);
   for(int i = 0; i < b.length; i++){
      //b[i] = new Bouncer(0,0,0,i*0.01+100,i*0.05+5,i*0.07+3,255,255,255, 2);
      b[i] = new Bouncer(0,0,0,2+2*i,i*2+4,i*2+6,255,255,255, 2);
   }
}

void draw(){
  background(255);
  strokeWeight(2);
  translate(width/2, height/2, -width);
  float mouseXmap = map(mouseX,-width/2,width/2, -180,180);
  float mouseYmap = map(mouseY,-height/2,height/2, -180,180);
  rotateX(radians(mouseXmap));
  rotateY(radians(mouseYmap));
  scale(scaling,scaling,scaling);
  
  for(int i = 0; i < b.length; i++){
      b[i].move();
      //b[i].bounce();
      b[i].accelerate();
      b[i].display();
   }
   
  
}
void mouseWheel(MouseEvent event){
    float e = event.getCount();
    scaling += e*0.06;
    println(scaling);
    if(scaling <= 0.05){
      scaling = 0.1;
    }
}
