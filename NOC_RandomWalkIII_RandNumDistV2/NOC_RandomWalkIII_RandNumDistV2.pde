int [] randomCounts; //it keeps track of how often random numbers are picked. 

void setup(){
 size(720,720);
 randomCounts = new int[50];
 background(255);
}

void draw(){
  //
  int index = int(random(randomCounts.length)); //Pick a random number and increase the count.
  randomCounts[index] = randomCounts[index]+50;
  
  noStroke();
  fill(175);
  int w = width/randomCounts.length;
  for (int x = 0; x < randomCounts.length; x++){ //graphing the results
    rect(x*w, height-randomCounts[x],w,randomCounts[x]);
  }
  for (int x = 0; x < randomCounts.length; x++){ //graphing the results
    rect(height-randomCounts[x],x*w,randomCounts[x], w);
  }
  
}
