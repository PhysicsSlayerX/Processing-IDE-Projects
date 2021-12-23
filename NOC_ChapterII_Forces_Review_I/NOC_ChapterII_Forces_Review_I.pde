// Simulating Superposition of Forces //
// Newton's Second Law of Motion //

Object[] ball;                                     //Declaring the object named "ball"
float radius, x, y, vx, vy, ax, ay, mass, vlimit;         //variables to be passed on the ball
boolean solidBound = true;                         //Create a boundary condition. Hard boundary - true
boolean recording = false;                         //Control for the movie making

//Magnitude scaling

float tick = 1;
float second = 60*tick;
float minute = 60*second;
float meter = 1;
float kilogram = 1;

//Physical Constants
float g = -(98.0)*(meter/pow(second, 2));
float windCoeffx;
float windCoeffy;
float perlinValueX = 0;              //Noise range for x-component of the wind
float perlinValueY = 10000;          //Noise range for y-component of the wind

//Control for the addition of forces

boolean gravExists = true;
boolean windExists = false;
float windCoeffmap = 98.0*(meter/pow(second, 2));  //Map the values for the force used 
                                                //for the Perlin Noise

//Control for the text display

 
float fontSize = 25;             //Set the font size
float textAdjust = 3.25*fontSize; //set the text spacing between texts
float textGroupInc1 = fontSize;  //Set the position text's initial position relative to the coordinate system
float textGroupInc2 = 2*fontSize;//Set the velocity text's initial position relative to the coordinate system
float textGroupInc3 = 3*fontSize;//Set the velocity text's initial position relative to the coordinate system
float columnPos = fontSize/2;             //Set the overall text column's postion relative to x-axis


void setup() {
  size(1600, 700);
  frameRate(60);
  ball = new Object[1];                               //Number of existing objects
  for (int i = 0; i < ball.length; i++) {
    radius = random(10*meter,50*meter);
    mass = radius*kilogram;
    x = 0;   //Set the initial x-position
    y = 0;                                             //Set the initial y-position
    vx = 0;                                            //Set initial x-velocity
    vy = 0;                                            //Set initial y-velocity
    ax = 0;                                            //Set initial x-acceleration
    ay = 0;                                            //Set initial y-acceleration
    vlimit = 1000;
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

void draw() {
  translate(width/2, height/2);
  scale(1, -1);
  fill(0, 70);    //persistence of vision effect
  rect(-width/2, -height/2, width, height);

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
