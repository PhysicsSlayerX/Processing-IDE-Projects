Motion3D[] ball = new Motion3D[500]; //initiate the number of objects
Motion3D[] ball2 = new Motion3D[100];

float x,y,z,vx,vy,vz;    //initiate the position and velocity
float ax = 0;       //set the x-acceleration
float ay = 0;
float az = 0;//set the y-acceleration
float factor = 2.0; //set the multiplication factor
float terminal = 20;//set the pseudo-terminal velocity
float textAdjust = 40; //set the text spacing
float fontSize = 10;
float textGroupInc1 = 10;
float textGroupInc2 = 20;
float textGroupInc3 = 30;
float columnPos = 20;
float shade = 255;
void setup(){
  //size(960,1017, P2D);
  fullScreen(P3D);
  //background(0);
  for(int i = 0; i < ball.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    z = random(0, height); 
    vx = random(-15,15);
    vy = random(-15,15);  
    vz = random(-15,15); 
    ball[i] = new Motion3D(x,y,z,vx,vy,vz,ax,ay,az,factor, terminal);
  }
  for(int i = 0; i < ball2.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    z = random(0, height); 
    vx = random(-2,2);
    vy = random(-2,2);
    vz = random(-2,2); 
    ball2[i] = new Motion3D(x,y,z,vx,vy,vz,ax,ay,az,factor, terminal-20);
  }
}
void draw(){
  fill(50);
  rect(0,0,250, height);
  fill(0);
  rect(250,0,width, height);
  //background(0);
  
  for(int i = 0; i < ball.length; i++){
    ball[i].calculate();
    ball[i].bounds();
    ball[i].display(textAdjust*i, fontSize, 
    textGroupInc1,textGroupInc2,textGroupInc3, columnPos, shade, 10); 
    //textAdjust, fontSize, and spacing
    //iterated under for loop
  }
  for(int i = 0; i < ball2.length; i++){
    ball2[i].calculate();
    ball2[i].bounds();
    ball2[i].display(textAdjust*i, fontSize, 
    textGroupInc1,textGroupInc2,textGroupInc3, columnPos+120, shade, 10); 
    //textAdjust, fontSize, and spacing
    //iterated under for loop
  }
}
