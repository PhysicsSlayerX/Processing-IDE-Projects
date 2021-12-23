//Friction Force

Mover[] mover;
float x,y;
float tx = 0;
float ty = 10000;
float incrementX = 0.01;
float incrementY = 0.01;

void setup(){
 size(500,500);
 frameRate(60);
 background(255);
 smooth();
 mover = new Mover[1];
 for(int i = 0; i < mover.length; i++){
   mover[i] = new Mover();
 }
 
}

void draw(){
  
  //background(255);
  fill(255,25);
  rect(0,0,width,height);
  
  for (Mover mover : mover){
    
    PVector gravity = new PVector(0,0.1);
    /*
      From previous lesson, we can scale the forces using the mass,
      just in accordance with the Newton's laws of motion.
    */
    gravity.mult(mover.mass);
    mover.applyForce(gravity);
    
    /*
    PVector wind = new PVector(0.2, 0);
    mover.applyForce(wind);
    */
    if(mousePressed){
      //Apply Friction
      /*
        Copy the velocity vector - this will serve for the direction.
        Since Friction opposes motion, 
        it make sense to put friction's direction opposite relative to
        object's velocity.
      */
      PVector friction = mover.velocity.copy(); //(get() is now copy())
      
      /* 
        By Vector rules, you normalize the velocity vector and apply it
        to the friction. vec(F) = mag(F)*unit_vec(lambda), where lambda
        is the unit vector coming from the normalized velocity vector. 
      */
      friction.normalize();
      /*
        the scalar multiplication with -1 tells the 180 deg flip of the vector.
      */
      friction.mult(-1);
      //c is the coefficient of kinetic friction. 
      float c = 0.1;
      /*
        The formula for k-friction is = (-1)*c*mag(Normal Force)*unit_vec(vel).
        For this example, mag(N) =  1, for simplicity.
      */
      float normal = 1;
      float frictionMag = c*normal;
      friction.mult(frictionMag);
      
      mover.applyForce(friction);
    }
    
   
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
}
