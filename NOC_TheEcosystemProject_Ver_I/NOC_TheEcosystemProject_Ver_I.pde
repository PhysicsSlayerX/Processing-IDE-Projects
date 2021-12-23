Motion2D[] ball = new Motion2D[500]; //initiate the number of objects
Motion2D[] ball2 = new Motion2D[1000];

float x,y,vx,vy;    //initiate the position and velocity
float ax = 0;       //set the x-acceleration
float ay = 0;       //set the y-acceleration
float factor = 2.0; //set the multiplication factor
float terminal = 30;//set the pseudo-terminal velocity
float textAdjust = 40; //set the text spacing
float fontSize = 10;
float textGroupInc1 = 10;
float textGroupInc2 = 20;
float textGroupInc3 = 30;
float columnPos = 20;
float shade = 255;
float radius = 7;
float particleColor = 255;
float terminalSpeedAdjuster = 10;
void setup(){
  fullScreen(P2D);
  //size(500,500, P2D);
  frameRate(120);
  //fullScreen(P2D);
  //background(0);
  for(int i = 0; i < ball.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    vx = random(2,4);
    vy = random(2,4);   
    ball[i] = new Motion2D(x,y,vx,vy,ax,ay,factor, terminal, radius, particleColor);
  }
  for(int i = 0; i < ball2.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    vx = random(1,5);
    vy = random(1,5);   
    ball2[i] = new Motion2D(x,y,vx,vy,ax,ay,factor, terminal-terminalSpeedAdjuster, radius, particleColor);
  }
}
void draw(){
  fill(50,50);
  rect(0,0,250, height);
  fill(0,50);
  rect(250,0,width, height);
  //background(0);
  for(int i = 0; i < ball.length; i++){
    ball[i].calculate();
    ball[i].bounds();
    ball[i].display(textAdjust*i, fontSize, 
    textGroupInc1,textGroupInc2,textGroupInc3, columnPos); 
    //textAdjust, fontSize, and spacing
    //iterated under for loop
  }
  for(int i = 0; i < ball2.length; i++){
    ball2[i].calculate();
    ball2[i].bounds();
    ball2[i].display(textAdjust*i, fontSize, 
    textGroupInc1,textGroupInc2,textGroupInc3, columnPos+120); 
    //textAdjust, fontSize, and spacing
    //iterated under for loop
  }
}
