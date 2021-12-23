//2D Perlin Noise, Exercise I.8, I.9

float zoff = 0;
float zoff2 = 10000;
float zoff3 = 20000;
void setup(){
  fullScreen(P2D);
  background(0);
  //size(200,200,P2D);
  //saveFrame("2DPerlinNoiseArt2.png");
}

void draw(){
  loadPixels();
  float xoff = 0;
  float xoff2 = 10000;
  float xoff3 = 20000.0;
  for (int x = 0; x < width; x++){
     float yoff = 0.0;
     float yoff2 = 10000.0;
     float yoff3 = 20000.0;
     for (int y = 0; y < height; y++){
       noiseDetail(8,0.65);            //definition or detail of the noise
       float bright1 = map(noise(xoff,yoff,zoff),0,1,0,255);
       float bright2 = map(noise(xoff2,yoff2,zoff2),0,1,0,255);
       float bright3 = map(noise(xoff3,yoff3,zoff3),0,1,0,255);
       pixels[x+y*width] = color(bright1,bright2, bright3);
       yoff += 0.001;
       yoff2 += 0.001;
       yoff3 += 0.001;
     }
     xoff += 0.001;
     xoff2 += 0.001;
     xoff3 += 0.001;
     
  }
  //zoff = zoff + 0.001;
  //zoff2 = zoff2 + 0.001;
  //zoff3 = zoff3 + 0.001;
  updatePixels();
}
