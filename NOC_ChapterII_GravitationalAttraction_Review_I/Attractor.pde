class Attractor {
  float mass;
  float constG;    
  float R, G, B, trans; //attractor's color
  float xA, yA; // Position of the attractor
  float w, h ; //attractor dimensions
  PVector loc;
 
  Attractor(
    float temp_mass,
    float temp_constG,
    int temp_R,
    int temp_G,
    int temp_B,
    int temp_trans,
    float temp_x,
    float temp_y,
    float temp_w,
    float temp_h
    ) {
    mass     = temp_mass;
    constG   = temp_constG;
    R        = temp_R;
    G        = temp_G;
    B        = temp_B;
    trans    = temp_trans;
    xA       = temp_x;
    yA       = temp_y;
    loc      = new PVector(xA, yA);
    w        = temp_w;
    h        = temp_h;
  }
 
  PVector attract(Object ball_) {
    PVector force = PVector.sub(loc,ball_.pos);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
 
    force.normalize();
    float strength = (constG * mass * ball_.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
 
  void display() {
    stroke(0);
    fill(R, G, B, trans);
    ellipse(loc.x,loc.y,w,h);
  }
}
