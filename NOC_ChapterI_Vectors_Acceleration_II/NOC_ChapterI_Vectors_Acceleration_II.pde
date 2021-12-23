Object[] ball;
float radius,x,y,vx,vy,ax,ay, mass,vlimit;         //variables to be passed on the ball
boolean solidBound = true;                         //Create a boundary condition. Hard boundary - true
boolean recording = false;

//Magnitude scaling

float second = 1;
float minute = 60*second;
float meter = 1;

void setup(){
  size(700,700);
  ball = new Object[20];
  for (int i = 0; i < ball.length; i++){
    radius = 20;
    mass = random(5,20);
    x = random(-width/2+radius/2, width/2-radius/2);   //Set the initial x-position
    y = 0;                                             //Set the initial y-position
    vx = random(1,15);                                 //Set initial x-velocity
    vy = 0;                                            //Set initial y-velocity
    ax = 0;                                            //Set initial x-acceleration
    ay = random(-1,1);                                 //Set initial y-acceleration
    vlimit = 50;
    ball[i] = new Object(radius, 
                         mass,
                         x,
                         y,
                         vx,
                         vy,
                         ax,
                         ay,
                         vlimit);
  }
}

void draw(){
  translate(width/2, height/2);
  scale(1,-1);
  fill(0,10);
  rect(-width/2, -height/2, width, height);
  for (int i = 0; i < ball.length; i++){
    ball[i].kinematics();
    ball[i].bounds(solidBound);
    ball[i].display();
  }
  if(recording){
    saveFrame("AnimationBall/ball_####.png");
  }
}
