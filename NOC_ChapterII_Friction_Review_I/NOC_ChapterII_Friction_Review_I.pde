// Simulating Superposition of Forces //
// Newton's Second Law of Motion //

Object[] ball;                                     //Declaring the object named "ball"
float radius, x, y, vx, vy, ax, ay, mass, vlimit;         //variables to be passed on the ball
boolean solidBound = true;                         //Create a boundary condition. Hard boundary - true
boolean recording = false;                         //Control for the movie making
int ballCount = 1;

//Magnitude scaling

float tick = 1;
float second = 60*tick;
float minute = 60*second;
float meter = 1;
float kilogram = 1;

//Physical Constants
float g = -(980.0)*(meter/pow(second, 2));
float windCoeffx;
float windCoeffy;
float perlinValueX = 1000;              //Noise range for x-component of the wind
float perlinValueY = 10000;          //Noise range for y-component of the wind
float windCoeffmap = 98.0*(meter/pow(second, 2));  //Map the values for the force used 
                                                //for the Perlin Noise

//Control for the addition of forces

boolean gravExists = true;
boolean windExists = false;
boolean frictionExists = true;

//Friction 
float mu = -150;
float normalForce = 9.8*((kilogram)*(meter/pow(second,2)));
float frictionMag = mu*normalForce;

//Control for the text display

 
float fontSize = 25;             //Set the font size
float textAdjust = 3.25*fontSize; //set the text spacing between texts
float textGroupInc1 = fontSize;  //Set the position text's initial position relative to the coordinate system
float textGroupInc2 = 2*fontSize;//Set the velocity text's initial position relative to the coordinate system
float textGroupInc3 = 3*fontSize;//Set the velocity text's initial position relative to the coordinate system
float columnPos = fontSize/2;             //Set the overall text column's postion relative to x-axis

//Controlling Pocket Shapes
Pockets[] pocket;        //Declaring pocket objects
int pocketCount = 150;
float R,G,B, transparency;
boolean circle;         //Declaring pocket shapes
boolean square;
boolean rectangle;
float pocketX;          //Position of the pockets
float pocketY; 
float scaleSize = 50; // Sizes of the shape
float wSize = 1;
float hSize = 1;

void setup() {
  size(900, 700);
  frameRate(60);
  ball = new Object[ballCount];                        //Number of existing objects
  for (int i = 0; i < ball.length; i++) {
    radius = random(10*meter,50*meter);
    mass = radius*kilogram;
    x = 0;                                             //Set the initial x-position
    y = 250;                                             //Set the initial y-position
    vx = 500*(meter/second);                                            //Set initial x-velocity
    vy = 0;                                            //Set initial y-velocity
    ax = 0;                                            //Set initial x-acceleration
    ay = 0;                                            //Set initial y-acceleration
    vlimit = 1000;
    ball[i] = new Object(radius,                       //Defining the ball
                         mass, 
                         x, 
                         y, 
                         vx, 
                         vy, 
                         ax, 
                         ay, 
                         vlimit);
  }
  pocket = new Pockets[pocketCount];
  for (int i = 0; i < pocket.length; i++){
    R = 255;
    G = 255;
    B = 255;
    transparency = 50;
    circle = true;          //must only choose 1 shape
    square = false;
    rectangle = false;
    pocketX = random(-width/2,width/2);
    pocketY = random(-height/2,height/2);
    pocket[i] = new Pockets(R,G,B,                       //Defining the pockets
                            transparency, 
                            circle,
                            square,
                            rectangle, 
                            pocketX, 
                            pocketY,
                            wSize*scaleSize,
                            hSize*scaleSize);
  }
}

void draw() {
  translate(width/2, height/2);
  scale(1, -1);
  fill(0, 50);    //persistence of vision effect
  rect(-width/2, -height/2, width, height);
  for (int i = 0; i < pocket.length; i++) {
    //Display the pockets
    pocket[i].pocketDisp();
  }
  
  for (int i = 0; i < ball.length; i++) {

    //Add gravitational force
    if (gravExists) {    
      PVector accelGravity = new PVector(0, g);
      accelGravity.mult(ball[i].mass); //Since mass is now a property of 
      //the ball object, we can access that value 
      //using the .(dot) notation
      ball[i].appliedForce(accelGravity);
    }
    //Add wind
    if (windExists) {
      //windCoeffx = random(-0.01,0.01); //randomized wind current x
      //windCoeffy = random(-0.01,0.01); //randomized wind current y
      windCoeffx = map(noise(perlinValueX), 0,1, -windCoeffmap, windCoeffmap); //Using Perlin Noise for the wind
      //windCoeffy = map(noise(perlinValueX), 0, 1, -windCoeffmap, windCoeffmap); //Using Perlin Noise for the wind
      PVector wind = new PVector(windCoeffx, windCoeffy);
      ball[i].appliedForce(wind);
    }
    //Add Friction
    if (frictionExists){
      for(int j = 0; j < pocket.length; j++){
        if(pocket[j].circle){
            if(ball[i].isPocket(pocket[j])){
                ball[i].friction(frictionMag);  //Applies friction on all objects, 
                                                //friction magnitude combined over overlapping areas
                fill(255,0,0, 50);              //Identifier if the ball is within the domain
                ellipse(pocket[j].x, pocket[j].y, pocket[j].w,pocket[j].h);
            }
        }
        if(pocket[j].square){
            if(ball[i].isPocket(pocket[j])){
                ball[i].friction(frictionMag);  //Applies friction on all objects, 
                fill(0,255,0, 50);              //Identifier if the ball is within the domain
                rect(pocket[j].x, pocket[j].y, pocket[j].w,pocket[j].h);
                                                //friction magnitude combined over overlapping areas
            }
        }
        if(pocket[j].rectangle){
            if(ball[i].isPocket(pocket[j])){
                ball[i].friction(frictionMag);  //Applies friction on all objects, 
                fill(0,0,255, 50);              //Identifier if the ball is within the domain
                rect(pocket[j].x, pocket[j].y, 2*pocket[j].w,pocket[j].h);
                                                //friction magnitude combined over overlapping areas
            }
        }
      }
    }

    ball[i].kinematics();       //Calculation for the motion of the ball
    ball[i].bounds(solidBound); //Calculation for the spatial boundary condition 
    ball[i].display(textAdjust*i, 
                    fontSize, 
                    textGroupInc1, 
                    textGroupInc2, 
                    textGroupInc3, 
                    columnPos);          //Displays the motion in the screen

    perlinValueX += 0.01;
    perlinValueY += 0.01;
  }
  if (recording) {
    saveFrame("AnimationBall/ball_####.png");
  }
}
