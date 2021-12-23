class Motion2D{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float factor;
  float terminal;
  float randomRadius;
  float particleColor;
  Motion2D(float x, float y, float vx, float vy,
  float ax, float ay, float tfactor, float tv, float radius, float tparticleColor){
    position = new PVector(x,y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(ax, ay);
    factor = tfactor;
    terminal = tv;
    randomRadius = random(radius);
    particleColor = random(200,tparticleColor);
    
  }
  void calculate(){
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(0.7);
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
  }
  void display(float textAdjust, float fontSize, float textGroupInc1,float textGroupInc2,float textGroupInc3, float columnPos){
    fill(particleColor,particleColor,particleColor,200);
    noStroke();
    ellipse(position.x, position.y, randomRadius,randomRadius);
    textSize(fontSize);
    fill(0,255,0);
    text("pV = " + "(" + round(position.x)+ "," + round(position.y) +")",columnPos, textGroupInc1 + textAdjust);
    text("vV = " + "(" + round(velocity.x)+ "," + round(velocity.y) +")",columnPos, textGroupInc2+ textAdjust);
    text("aV = " + "(" + round(acceleration.x)+ "," + round(acceleration.y) +")", columnPos, textGroupInc3+ textAdjust);
    
  }
}
