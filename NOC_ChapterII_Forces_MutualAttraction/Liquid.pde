class Liquid {
  
  float c,R,G,B;
  float x,y,w,h;
  Liquid(float x_, float y_, float w_, float h_,
         float c_, float R_, float G_, float B_){
           x = x_;
           y = y_;
           w = w_;
           h = h_;
           c = c_;
           R = R_;
           G = G_;
           B = B_;
  }
     
     
  void display(){
    noStroke();
    fill(R,G,B);
    rect(x,y,w,h);
    
  }
  
  
}
