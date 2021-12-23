// Simulating Superposition of Forces //
// Newton's Second Law of Motion //


Object[] ball;                                     //Declaring the object named "ball"
float radius, x, y, vx, vy, ax, ay, mass, vlimit;         //variables to be passed on the ball
boolean solidBound = true;                         //Create a boundary condition. Hard boundary - true
boolean recording = false;                         //Control for the movie making
int ballCount = 100;

//Magnitude scaling

float tick = 1;
float second = 60*tick;
float minute = 60*second;
float meter = 1;
float kilogram = 1;

//Physical Constants
float g = (980.0)*(meter/pow(second, 2));
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
boolean fluidDragExists = true;
boolean hardWallsExists = false;
boolean gravAttractExists = false;

//Friction 
float mu = 150;
float normalForce = 9.8*((kilogram)*(meter/pow(second, 2)));
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
int pocketCount = 10;
float R, G, B, transparency;
boolean circle;         //Declaring pocket shapes
boolean square;
boolean rectangle;
float pocketX;          //Position of the pockets
float pocketY; 
float scaleSize = 25; // Sizes of the shape
float wSize = 1;
float hSize = 1;

//Fluid Drag Constants
StaticFluid[] Liquid; //Declare a static fluid object
float rho;            //Density of the fluid
float crossA;         //Cross-sectional Area of the object
float Cd;             //Drag Coefficient
float lengthX, widthY, fluidPosX, fluidPosY; //Fluid dimensions
float fluidR, fluidG, fluidB, fluidAlph; //Fluid's color and transparency
int fluidCount = 10;    //number of fluid pockets
boolean fluid_circ;
boolean fluid_squa;
boolean fluid_rect;

//HardWalls Exists
hardWalls[] HW;        //Declaring hardwalls objects
int hwCount = 1;
float hwR, hwG, hwB, hw_transparency;
boolean hw_circle;         //Declaring hardwalls shapes
boolean hw_square;
boolean hw_rectangle;
float hw_X;          //Position of the hardwalls
float hw_Y; 
float hw_scaleSize = 5;   // Sizes of the shape
float hw_wSize;
float hw_hSize;

//Attractor Exists
Attractor[] attractor;
int attractorCount = 2;
float A_mass, A_constG;
int A_R, A_G, A_B, A_transparency;
float A_x, A_y, A_w, A_h;


void setup() {
  size(900, 900);
  frameRate(60);
  ball = new Object[ballCount];                        //Number of existing objects
  for (int i = 0; i < ball.length; i++) {
    radius = 5;//random(25*meter, 50*meter);
    mass = radius*kilogram;
    x = random(-width/2, width/2);//-width/2+100;                                             //Set the initial x-position
    y = random(-height/2, height/2);//random(-350, 350);                                             //Set the initial y-position
    vx = random(-200*(meter/second), 200*(meter/second));//350*(meter/second);                                            //Set initial x-velocity
    vy = random(-200*(meter/second), 200*(meter/second));//random(-150*(meter/second), 150*(meter/second));                                            //Set initial y-velocity
    ax = 0;                                            //Set initial x-acceleration
    ay = 0;                                            //Set initial y-acceleration
    vlimit = 1000;
    ball[i] = new Object(radius, //Defining the ball
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
  for (int i = 0; i < pocket.length; i++) {
    R = 255;
    G = 255;
    B = 255;
    transparency = 20;
    circle = false;          //must only choose 1 shape
    square = false;
    rectangle = true;
    pocketX = random(-width/2, width/2);
    pocketY = random(-height/2, height/2);
    pocket[i] = new Pockets(R, G, B, //Defining the pockets
      transparency, 
      circle, 
      square, 
      rectangle, 
      pocketX, 
      pocketY, 
      wSize*scaleSize, 
      hSize*scaleSize);
  }

  Liquid  =  new StaticFluid[fluidCount];
  for (int i = 0; i < Liquid.length; i++) {
    rho = 1;
    crossA = 1;
    Cd = 0.5;
    lengthX = 100; 
    widthY = 100; 
    fluidPosX = random(-width/2, width/2); 
    fluidPosY = random(-height/2, height/2); 
    fluidR = 255;
    fluidG = 255; 
    fluidB = 255; 
    fluidAlph = 50;
    fluid_circ = true;
    fluid_squa = false;
    fluid_rect = false;

    Liquid[i] = new StaticFluid(fluidPosX, 
      fluidPosY, 
      lengthX, 
      widthY, 
      Cd, 
      rho, 
      crossA, 
      fluidR, 
      fluidG, 
      fluidB, 
      fluidAlph, 
      fluid_circ, 
      fluid_squa, 
      fluid_rect);
  }
  HW = new hardWalls[hwCount];
  for (int i = 0; i < HW.length; i++) {
    hwR = 255;
    hwG = 200;
    hwB = 150;
    hw_transparency = 20;
    hw_circle = false;          //must only choose 1 shape
    hw_square = true;
    hw_rectangle = false;
    hw_X = 0;//random(-width/2, width/2);
    hw_Y = 0;//random(-height/2, height/2);
    hw_wSize = 400;//hw_scaleSize*random(20);
    hw_hSize = 0.5*hw_wSize;
    HW[i] = new hardWalls(hwR, hwG, hwB, //Defining the hardwalls
      hw_transparency, 
      hw_circle, 
      hw_square, 
      hw_rectangle, 
      hw_X, 
      hw_Y, 
      hw_wSize, 
      hw_hSize);
  }
  attractor = new Attractor[attractorCount];
  for (int i = 0; i < attractor.length; i++) {
    A_mass         = 30;
    A_constG       = 0.8; 
    A_R            = 0; 
    A_G            = 0;
    A_B            = 200; 
    A_transparency = 255;
    A_x            = 0;
    A_y            = 0;
    A_w            = 40;
    A_h            = 40;
    attractor[i] = new Attractor(A_mass, 
      A_constG+(-1.5*i*A_constG), 
      A_R+i*200, 
      A_G, 
      A_B-i*200, 
      A_transparency,
      A_x+i*100,
      A_y+i*200,
      A_w,
      A_h);
  }
}

void draw() {
  translate(width/2, height/2);
  scale(1, 1);
  fill(0, 50);    //persistence of vision effect
  rect(-width/2, -height/2, width, height);
  
  // Displaying the Objects
  if (frictionExists) {
    for (int k = 0; k < pocket.length; k++) {
      //Display the pockets
      pocket[k].pocketDisp();
    }
  }
  if (fluidDragExists) {
    for (int k = 0; k < Liquid.length; k++) {
      Liquid[k].fluidDisplay();
    }
  }
  if (hardWallsExists) {
    for (int k = 0; k < HW.length; k++) {
      HW[k].hardWallDisp();
    }
  }
  if(gravAttractExists){
    for (int k = 0; k < attractor.length; k++) {
      attractor[k].display();
    }
  }

  // Dynamic Programming
  
  for (int i = 0; i < ball.length; i++) {
    //Gravitational and Wind Forces are not declared as methods inside the Object Class.
    //Add gravitational force
    if (gravExists) {    
      PVector accelGravity = new PVector(0, g);
      accelGravity.mult(ball[i].mass); //Since mass is now a property of 
      //the ball object, we can access that value 
      //using the .(dot) notation
      ball[i].appliedForce(accelGravity);
    } else {
      PVector accelGravity = new PVector(0, 0);
      accelGravity.mult(ball[i].mass); //Since mass is now a property of 
      //the ball object, we can access that value 
      //using the .(dot) notation
      ball[i].appliedForce(accelGravity);
    }  
    //Add wind
    if (windExists) {
      //windCoeffx = random(-0.01,0.01); //randomized wind current x
      //windCoeffy = random(-0.01,0.01); //randomized wind current y
      windCoeffx = map(noise(perlinValueX), 0, 1, -windCoeffmap, windCoeffmap); //Using Perlin Noise for the wind
      //windCoeffy = map(noise(perlinValueX), 0, 1, -windCoeffmap, windCoeffmap); //Using Perlin Noise for the wind
      PVector wind = new PVector(windCoeffx, windCoeffy);
      ball[i].appliedForce(wind);
    }

    //Add Friction
    if (frictionExists) {
      for (int j = 0; j < pocket.length; j++) {
        if (pocket[j].circle) {
          if (ball[i].isPocket(pocket[j])) {
            ball[i].friction(frictionMag);  //Applies friction on all objects, 
            //friction magnitude combined over overlapping areas
            fill(255, 0, 0, 50);              //Identifier if the ball is within the domain
            ellipse(pocket[j].x, pocket[j].y, pocket[j].w, pocket[j].h);
          }
        }
        if (pocket[j].square) {
          if (ball[i].isPocket(pocket[j])) {
            ball[i].friction(frictionMag);  //Applies friction on all objects, 
            fill(0, 255, 0, 50);              //Identifier if the ball is within the domain
            rect(pocket[j].x, pocket[j].y, pocket[j].w, pocket[j].h);
            //friction magnitude combined over overlapping areas
          }
        }
        if (pocket[j].rectangle) {
          if (ball[i].isPocket(pocket[j])) {
            ball[i].friction(frictionMag);  //Applies friction on all objects, 
            fill(0, 0, 255, 50);              //Identifier if the ball is within the domain
            rect(pocket[j].x, pocket[j].y, 2*pocket[j].w, pocket[j].h);
            //friction magnitude combined over overlapping areas
          }
        }
      }
    }
    if (fluidDragExists) {

      for (int j = 0; j < Liquid.length; j++) {
        if (Liquid[j].circle) {
          if (ball[i].isFluid(Liquid[j])) {
            ball[i].fluidDrag(Liquid[j]);  //Applies Fluid Drag on all objects, 

            fill(150, 0, 255, 50);              //Identifier if the ball is within the domain
            ellipse(Liquid[j].x, Liquid[j].y, Liquid[j].w, Liquid[j].h);
          }
        }
        if (Liquid[j].square) {
          if (ball[i].isFluid(Liquid[j])) {
            ball[i].fluidDrag(Liquid[j]);  //Applies Fluid Drag on all objects, 
            fill(255, 0, 0, 50);              //Identifier if the ball is within the domain
            rect(Liquid[j].x, Liquid[j].y, Liquid[j].w, Liquid[j].h);
          }
        }
        if (Liquid[j].rectangle) {
          if (ball[i].isFluid(Liquid[j])) {
            ball[i].fluidDrag(Liquid[j]);  //Applies Fluid Drag on all objects,
            fill(0, 255, 0, 50);              //Identifier if the ball is within the domain
            rect(Liquid[j].x, Liquid[j].y, 2*Liquid[j].w, Liquid[j].h);
          }
        }
      }
    }
    if (hardWallsExists) {

      for (int j = 0; j < HW.length; j++) {
        if (HW[j].circle) {
          if (ball[i].isHW(HW[j])) { 
            //ball[i].hardWallBC();  //Apply Hard Wall BC to the moving object
            fill(150, 0, 255, 70);              //Identifier if the ball is within the domain
            ellipse(HW[j].x, HW[j].y, HW[j].w, HW[j].h);
          }
        }
        if (HW[j].square) {
          if (ball[i].isHW(HW[j])) {
            ball[i].hardWallBCx(HW[j]);
            ball[i].hardWallBCy();
            fill(255, 0, 0, 50);              //Identifier if the ball is within the domain
            rect(HW[j].x, HW[j].y, HW[j].w, HW[j].h);
          }
          if (HW[j].rectangle) {
            if (ball[i].isHW(HW[j])) {
              //ball[i].hardWallBC();  //Apply Hard Wall BC to the moving object 
              fill(200, 175, 0, 50);              //Identifier if the ball is within the domain
              rect(HW[j].x, HW[j].y, HW[j].w, HW[j].h);
            }
          }
        }
      }
    }
    //Add Gravitational Attraction 
    if(gravAttractExists){
        for (int k = 0; k < attractor.length; k++) {
           PVector force = attractor[k].attract(ball[i]);
           ball[i].appliedForce(force);
        }
    }
      
    ball[i].kinematics();       //Calculation for the motion of the ball
    ball[i].bounds(solidBound); //Calculation for the spatial boundary condition 
    /*
  ball[i].textdisplay(textAdjust*i, 
     fontSize, 
     textGroupInc1, 
     textGroupInc2, 
     textGroupInc3, 
     columnPos);          
     */
    ball[i].objectDisplay(); //Displays the motion in the screen

    perlinValueX += 0.01;
    perlinValueY += 0.01;
 
  if (recording) {
    saveFrame("AnimationBall/ball_####.png");
  }
 }
}
