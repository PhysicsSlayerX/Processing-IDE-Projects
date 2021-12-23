
float x1, x2;
String hilbert_seq = "a";
float j;
int i;
float colorScaling = 0.001;
float angle = 90;
float steps = 1.1;

void setup() {
  //fullScreen();
  size(700, 700);
  background(0);
  colorMode(HSB);
  x1 = width/2;
  x2 = height/2;
  for (int i = 0; i < 6; i++) {
    String new_seq = "";
    for (int j = 0; j < hilbert_seq.length(); j++) {
      if (hilbert_seq.charAt(j) == 'a') {
        new_seq += "-bF+aFa+Fb-Fba--bFa++-";
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
      fill(float(i)*colorScaling, 255, 255);
      forwardFunction(steps);
    } else if (hilbert_seq.charAt(i) == '+') {
      turnRight(angle);
    } else if (hilbert_seq.charAt(i) == '-') {
      turnLeft(angle);
    }
  }
  popMatrix();
  
  
  
}

void draw() {
}

void forwardFunction(float steps) {
  //fill(255);
  for (float i = 0; i < steps; i+=0.1) {
    translate(i, 0);
    ellipse(0, 0, i, i);
  }
}

void turnLeft(float angle) {
  rotate(radians(angle));
}

void turnRight(float angle) {
  rotate(radians(-angle));
}
