import processing.svg.*;

float x1, x2;
String hilbert_seq = "a";
float j;
int i;


void setup() {
  //fullScreen();
  size(700, 700); // SVG, "Hilbert2.svg");
  frameRate(120);
  background(0);
  colorMode(HSB);
  rectMode(CENTER);
  x1 = 20;
  x2 = height-20;
  for (int i = 0; i < 6; i++) {
    String new_seq = "";
    for (int j = 0; j < hilbert_seq.length(); j++) {
      if (hilbert_seq.charAt(j) == 'a') {
        new_seq += "-bF+aFa+Fb-";
        println("-bF+aFa+Fb-");
      } else if (hilbert_seq.charAt(j) == 'b') {
        new_seq += "+aF-bFb-Fa+";
        println("+aF-bFb-Fa+");
      } else {
        new_seq += hilbert_seq.charAt(j);
      }
    }
    hilbert_seq = new_seq;
  }

  println(hilbert_seq);
  noStroke();
  
  translate(x1, x2);
  scale(1, -1);
  pushMatrix();
  for (int i = 0; i < hilbert_seq.length(); i++) {
    if (hilbert_seq.charAt(i) == 'F') {
      fill(float(i)*0.015, 255, 255);
      forwardFunction(1.0);
    } else if (hilbert_seq.charAt(i) == '+') {
      turnRight(90);
    } else if (hilbert_seq.charAt(i) == '-') {
      turnLeft(90);
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
    rect(0, 0, 4, 4);
  }
}

void turnLeft(float angle) {
  rotate(radians(angle));
}

void turnRight(float angle) {
  rotate(radians(-angle));
}
