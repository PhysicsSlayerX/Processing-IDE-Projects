class StaticFluid {
  float x, y, w, h;   //Fluid dimensions
  float Cd;        //coefficient of drag
  float crossA;     //Cross-sectional Area
  float rho;       //fluid's density
  float R, G, B;     //Fluid color
  float alph;      //Fluid Transparency
  boolean circle;
  boolean square;
  boolean rectangle;

  StaticFluid(float x_, 
    float y_, 
    float w_, 
    float h_, 
    float Cd_, 
    float rho_, 
    float crossA_, 
    float R_, 
    float G_, 
    float B_, 
    float alph_, 
    boolean circ_, 
    boolean squa_, 
    boolean rect_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    Cd = Cd_;
    rho = rho_;
    crossA = crossA_;
    R = R_;
    G = G_;
    B = B_;
    alph = alph_;
    circle = circ_;
    square = squa_;
    rectangle = rect_;
  }

  void fluidDisplay() {
    noStroke();
    fill(R, G, B, alph);
    if (circle) {
      ellipse(x, y, w, h);
    }
    if (square) {
      rect(x, y, w, h);
    }
    if (rectangle) {
      rect(x, y, 2*w, h);
    }
  }
}
