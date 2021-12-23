int[] randomCounts;

void setup(){
 size(640,240);
 frameRate(120);
 smooth();
 noStroke();
 randomCounts = new int[20];
 
}
void draw(){
  background(0);
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  fill(175);
  int w = width/randomCounts.length;
  
  for(int x = 0; x <randomCounts.length; x++){
    rect(x*w, height, w-1, -randomCounts[x]);
  }
}

  
