//import processing.svg.*;

float x1, x2;
String kochSierpinski = "a";
float j;
int i;
float adjustFactor;
int iteration;
float scalarFactor;
float angle, colorScalar;
float radius;


void setup() {
  //fullScreen();
  size(1000, 900); // SVG, "Hilbert2.svg");
  frameRate(120);
  background(0);
  colorMode(HSB);
  rectMode(CENTER);
  iteration = 8;
  adjustFactor = 35;
  scalarFactor = 0.6;
  //x1 = adjustFactor;
  //x2 = height-adjustFactor;
  x1 = 40;
  x2 = height-40;
  angle = -60;
  colorScalar = 0.015;
  radius = 2;
  for (int i = 0; i < iteration; i++) {
    String new_seq = "";
    for (int j = 0; j < kochSierpinski.length(); j++) {
      if (kochSierpinski.charAt(j) == 'a') {
        new_seq += "b-a-b";
        println("b-a-b");
      } else if (kochSierpinski.charAt(j) == 'b') {
        new_seq += "a+b+a";
        println("a+b+a");
      } else {
        new_seq += kochSierpinski.charAt(j);
      }
    }
    kochSierpinski = new_seq;
  }

  println(kochSierpinski);
  noStroke();
  
  translate(x1, x2);
  scale(1, -1);
  pushMatrix();
  for (int i = 0; i < kochSierpinski.length(); i++) {
    if (kochSierpinski.charAt(i) == 'a'|| kochSierpinski.charAt(i) == 'b') {
      fill(float(i)*colorScalar, 255, 255);
      forwardFunction(scalarFactor);
    } else if (kochSierpinski.charAt(i) == '+') {
      turnRight(angle);
    } else if (kochSierpinski.charAt(i) == '-') {
      turnLeft(angle);
    }
  }
  popMatrix();
  
  println("Finished");
  //exit();
  
}

void draw() {
}

void forwardFunction(float steps) {
  //fill(255);
  for (float i = 0; i < steps; i+=0.1) {
    translate(steps, 0);
    //rect(0, 0, 4, 4);
    ellipse(0,0,radius,radius);
  }
}

void turnLeft(float angle) {
  rotate(radians(angle));
}

void turnRight(float angle) {
  rotate(radians(-angle));
}
