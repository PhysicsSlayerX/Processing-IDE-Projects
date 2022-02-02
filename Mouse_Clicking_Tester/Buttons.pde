class Buttons {
  float x,y,w,h;
  float R,G,B, alpha;
  
  Buttons(float x_, float y_, float w_, 
          float h_, int R_, int G_, int B_, int alpha_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    R = R_;
    G = G_;
    B = B_;
    alpha = alpha_;
    
    
  }
  
  void buttonDisplay(){
    noStroke();
    fill(R, G, B, alpha);
    rect(x,y,w,h);
  }
}
