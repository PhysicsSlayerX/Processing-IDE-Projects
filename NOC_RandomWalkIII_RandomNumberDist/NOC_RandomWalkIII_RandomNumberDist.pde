int [] randomCounts; //it keeps track of how often random numbers are picked. 

void setup(){
 size(720,720);
 randomCounts = new int[20];
}

void draw(){
  background(255);
  int index = int(random(randomCounts.length)); //Pick a random number and increase the count.
  randomCounts[index]++;
  
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  for (int x = 0; x < randomCounts.length; x++){ //graphing the results
    rect(x*w, height-randomCounts[x],w-1,randomCounts[x]);
  }
}
