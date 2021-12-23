

void setup()
{
  size(480,480);
  smooth();
  point(239,239); //creates a point located at x=239, y-239
  point(239,240);
  point(239,241);
  point(239,242);
  point(239,243);
  point(239,244);
  point(239,245);
  point(239,246);
  point(239,247);
  point(239,248);
  point(239,249);
  point(239,249);
  point(240,250);
  point(241,251);
  point(242,252);
  point(243,253);
  point(244,254);
  point(245,255);
  point(246,256);
  point(247,257);
  point(248,258);
  point(249,259);
  point(250,260);
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
