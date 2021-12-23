Mover[] movers = new Mover[100];   //Create 100 Mover Objects

float particle_mass;
float init_x, init_y;

void setup(){
  size(500,500);
  init_x        = width/2;
  init_y        = height/2;
  particle_mass = 10;
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(particle_mass), random(-init_x, init_x), random(-init_y, init_y));
    
  }
}

void draw(){
  background(0);
  //Set Coordinate Settings
  translate(width/2, height/2);
  scale(1, 1); 
  rotate(0);
  //Add the forces
  
  for (int i = 0; i < movers.length; i++){
    PVector wind = new PVector(0,0);
    if (mousePressed && (mouseButton == LEFT)) {
      wind = new PVector(0.01,0);
      wind.mult(-1);
    } else if (mousePressed && (mouseButton == CENTER)) {
      wind.mult(0);
    } else if (mousePressed && (mouseButton == RIGHT)) {
      wind = new PVector(0.01,0);
    }
    //Gravity Scaled by Mass
    float m = movers[i].mass;
    PVector gravity  = new PVector(0, 0.1*m);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    //Update the calculations
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
