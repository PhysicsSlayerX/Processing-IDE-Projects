

void setup()
{
  size(480,480);
  smooth();
}

void draw(){
  if(mousePressed){
    fill(0);
  } else {
    fill(255);
  }
  stroke(0);
  ellipse(mouseX, mouseY, 80,80);
}


// line(50,50,80,80); //length_x, lenght_y, position_x, position_y 
