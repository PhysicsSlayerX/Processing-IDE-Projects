//The Nature of Code, Example I.5

import java.util.Random;

Random gen;

int [] randomCounts; //it keeps track of how often random numbers are picked. 

void setup(){
 size(720,720);
 //gen = new Random(20);
 randomCounts = new int[width];
}

void draw(){
  background(255);
  float n = montecarlo();
  int index = int(n*width);
  /*
  float num = (float)gen.nextGaussian();
  float sd = 60;
  float mean = width/2;
  int value = int(abs(sd*num+mean));
  int index = value; //Pick a random number and increase the count.
  randomCounts[index]++;
  println(value);
  */
  randomCounts[index]++;
  
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  for (int x = 0; x < randomCounts.length; x++){ //graphing the results
    rect(x*w, height-randomCounts[x],w-1,randomCounts[x]);
  }
}

float montecarlo(){
  while (true){
    float r1 = random(1);
    float probability = r1;
    float r2 = random(1);
    float y = r1*r1;
    
    if (r2 < y){
      return r1;
    }
  }
}
