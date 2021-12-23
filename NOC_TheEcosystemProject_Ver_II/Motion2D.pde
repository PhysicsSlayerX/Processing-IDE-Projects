//Creating a code for the 3D Motion Vectors

class Motion3D{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float factor;
  float terminal;
  Motion3D(float x, float y, float z, float vx, float vy, float vz,
  float ax, float ay, float az, float tfactor, float tv){
    position = new PVector(x,y,z);
    velocity = new PVector(vx, vy,vz);
    acceleration = new PVector(ax, ay, az);
    factor = tfactor;
    terminal = tv;
    
  }
  void calculate(){
    PVector mouse = new PVector(mouseX, mouseY, 0);
    mouse.sub(position);
    mouse.setMag(2.0);
    acceleration = mouse;
    acceleration.mult(factor);
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(terminal);
    
  }
  void bounds(){
    if (position.x > width){
      position.x = 0;
    } else if(position.x < 0){
      position.x = width;
    }
    if (position.y > height){
      position.y = 0;
    } else if(position.y < 0){
      position.y = height;
    } 
    if (position.z > height){
      position.z = 0;
    } else if(position.z < 0){
      position.z = height;
    }
  }
  void display(float textAdjust, float fontSize, float textGroupInc1,float textGroupInc2,float textGroupInc3, float columnPos, float shade,float radius){
    
    
    fill(0,255,0);
    textSize(fontSize);
    text("pV = " + "(" + round(position.x)+ "," + round(position.y) + round(position.z) +")" ,columnPos, textGroupInc1 + textAdjust);
    text("vV = " + "(" + round(velocity.x)+ "," + round(velocity.y)  + round(velocity.z) +")",columnPos, textGroupInc2+ textAdjust);
    text("aV = " + "(" + round(acceleration.x)+ "," + round(acceleration.y)+ round(acceleration.z) +")" , columnPos, textGroupInc3+ textAdjust);
    
    float randomRadius = radius; //random(radius);
    
    pushMatrix();
    
    fill(shade,shade,shade);
    noStroke();
    
    
    translate(position.x,position.y,position.z);
    scale(0.3,0.3,0.3);
    
    sphere(randomRadius);
    
    popMatrix();
    //ellipse(position.x, position.y, randomRadius,randomRadius);
    
    
  }
}
