class Pockets{
  
  float R,G,B,transparency; //Pocket's color
  //Pocket's shapes
  boolean circle;
  boolean square;
  boolean rectangle;
  float x, y; // Position of the pockets
  float w,h ; //square and rectangle dimensions
  
  /*
    Note that everything we declare here can be accessed in any program through
    the dot(.) notation
  */
  Pockets(float R_, float G_, float B_, float trans_,
          boolean circ_, boolean squa_, boolean rect_, float x_, float y_, float w_, float h_){
          R = R_;
          G = G_;
          B = B_;
          transparency = trans_;
          circle = circ_;
          square = squa_;
          rectangle = rect_;
          x = x_;
          y = y_;
          w = w_;
          h = h_;
  }
  void pocketDisp(){
     noStroke();
     fill(R,G,B, transparency);
     if(circle){
       ellipse(x,y, w, h);
     }
     if(square){
       rect(x, y, w , h);
     }
     if(rectangle){
       rect(x, y, 2*w , h);
     }

  }
  
  
  
  
   
}
