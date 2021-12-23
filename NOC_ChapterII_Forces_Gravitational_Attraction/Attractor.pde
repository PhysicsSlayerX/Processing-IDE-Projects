

class Attractor {
  PVector location;
  float mass;
  float G = 1;
  PVector dragOffset = new PVector(0.0,0.0);
  Attractor(){
    
    location = new PVector(0,0);
    mass = 20;
    G = 5;
    dragOffset = new PVector(0.0,0.0);
  } 
  PVector attract(Motion mover){
    
    //Direction of the force
    PVector force = PVector.sub(location, mover.location);
    float d  = force.mag();
    d = constrain(d, 5,25);
    force.normalize();
    
    //Magnitude of the force
    float strength = (G*mass*mover.mass)/(d*d);
    //Putting magnitude and direction together
    force.mult(strength);
    return force;
  }
  void display() {
    strokeWeight(5);
    stroke(175,175,100);
    fill(155,255,150);
    ellipse(location.x,location.y, mass*2, mass*2);
  }
}
