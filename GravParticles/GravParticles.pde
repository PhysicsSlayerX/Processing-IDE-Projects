Motion2D[] ball = new Motion2D[1000]; //initiate the number of objects
Motion2D[] ball2 = new Motion2D[500];

float x,y,vx,vy;    //initiate the position and velocity
float ax = 0;       //set the x-acceleration
float ay = 0;       //set the y-acceleration
float factor = 2.0; //set the multiplication factor
float terminal = 40;//set the pseudo-terminal velocity
float textAdjust = 40; //set the text spacing
float fontSize = 10;
float textGroupInc1 = 10;
float textGroupInc2 = 20;
float textGroupInc3 = 30;
float columnPos = 20;
float shade = 255;
void setup(){
  //size(1000,540, P2D);
  fullScreen(P2D);
  //background(0);
  for(int i = 0; i < ball.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    vx = random(-20,20);
    vy = random(-20,20);   
    ball[i] = new Motion2D(x,y,vx,vy,ax,ay,factor, terminal);
  }
  for(int i = 0; i < ball2.length; i++){
    x = random(0, width);
    y = random(0, height); //set the x,y,vx,vx
    vx = random(-20,20);
    vy = random(-20,20);   
    ball2[i] = new Motion2D(x,y,vx,vy,ax,ay,factor+5, terminal);
  }
}
void draw(){
  fill(50,50);
  rect(0,0,300, height);
  fill(0,50);
  rect(300,0,width, height);
  //background(0);
  for(int i = 0; i < ball.length; i++){
    ball[i].calculate();
    ball[i].bounds();
    ball[i].display(textAdjust*i, fontSize, 
    textGroupInc1,textGroupInc2,textGroupInc3, columnPos, 0, 10); 
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

class Motion2D{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float factor;
  float terminal;
  Motion2D(float x, float y, float vx, float vy,
  float ax, float ay, float tfactor, float tv){
    position = new PVector(x,y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(ax, ay);
    factor = tfactor;
    terminal = tv;
    
  }
  void calculate(){
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(2.0);
    acceleration = mouse;
    acceleration.mult(factor);
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(terminal);
    
  }
  void bounds(){
    if (position.x > width){
      position.x = 0;
    } else if(position.x < 0){
      position.x = width;
    }
    if (position.y > height){
      position.y = 0;
    } else if(position.y < 0){
      position.y = height;
    }
  }
  void display(float textAdjust, float fontSize, float textGroupInc1,float textGroupInc2,float textGroupInc3, float columnPos, float shade,float radius){
    fill(random(shade),random(150,255),random(150,255));
    noStroke();
    float randomRadius = random(radius);
    ellipse(position.x, position.y, randomRadius,randomRadius);
    textSize(fontSize);
    fill(0,255,0);
    text("pV = " + "(" + round(position.x)+ "," + round(position.y) +")",columnPos, textGroupInc1 + textAdjust);
    text("vV = " + "(" + round(velocity.x)+ "," + round(velocity.y) +")",columnPos, textGroupInc2+ textAdjust);
    text("aV = " + "(" + round(acceleration.x)+ "," + round(acceleration.y) +")", columnPos, textGroupInc3+ textAdjust);
    
  }
}
