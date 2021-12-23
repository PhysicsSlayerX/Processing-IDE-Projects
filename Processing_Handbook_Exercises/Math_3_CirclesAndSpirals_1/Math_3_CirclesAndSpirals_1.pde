colorfulSpiral spirals1;
colorfulSpiral spirals2;
colorfulSpiral spiralsAnimated;
colorfulSpiral spiralsAnimated1;
colorfulSpiral spiralsAnimated2;

float x1, x2, rotCoeff;
float radius = 0.15;
float cx = 0;
float cy = 0;
float px = cx;
float py = cy;
int colorFactor = 0;
int deg;

void setup() {
  fullScreen();
  //size(1080,1920);
  smooth();
  background(0);
  colorMode(HSB);
  x1 = width/2;
  x2 = height/2;
  
  spiralsAnimated = new colorfulSpiral(x1, x2, 0, 0);
  spiralsAnimated1 = new colorfulSpiral(x1, x2, x1/1.5, x2/2);
  spiralsAnimated2 = new colorfulSpiral(x1, x2, -x1/1.5, -x2/2);
  //steadyStateSpiral();
  /*
  pushMatrix();
  spirals1 = new colorfulSpiral(x1, x2, x1/2, 0);
  spirals1.show();
  popMatrix();
  
  pushMatrix();
  spirals2 = new colorfulSpiral(x1, x2, -x1/2, 0);
  spirals2.show();
  popMatrix();
  */
}

void draw() {
  spiralsAnimated.display();
  spiralsAnimated1.display();
  spiralsAnimated2.display();
}

void steadyStateSpiral() {

  rotCoeff= 0;
  translate(x1, x2);
  scale(1, -1);
  pushMatrix();
  rotate(radians(rotCoeff));
  float radius = 0.15;
  float cx = 0;
  float cy = 0;
  float px = cx;
  float py = cy;
  strokeWeight(1);
  int colorFactor = 0;
  for (int deg = 0; deg < 360*500; deg += 10) {
    colorFactor++;
    stroke(colorFactor, 255, 255);
    float angle = radians(deg);
    float x = cx + (cos(angle)*radius);
    float y = cy + (sin(angle)*radius);
    line(px, py, x, y);
    radius*=1.02;
    px = x;
    py = y;
    if (colorFactor > 255) {
      colorFactor = 0;
    }
  }
  /*
  float diameter = 90;
   float colorCoeff = 20;
   float deltaD = 5;
   float layer = 10;
   for (float i = 0; i < layer; i+=2){
   fill(255-i*colorCoeff);
   stroke(255-i*colorCoeff);
   ellipse(cx,cy, diameter-i*deltaD,diameter-i*deltaD);
   
   }*/
  popMatrix();
}
