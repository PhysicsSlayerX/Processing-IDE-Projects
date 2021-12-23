float x, y, amplitude; 
String[] linesSeparate; 

void setup(){
  size(960, 540);
  background(0);
  smooth();
  x = 0;
  y = height/2;
  amplitude = 100;
  String[] lines = loadStrings("WaveSum.txt");
  linesSeparate = split(lines[0], ' ');
  println("There are " + linesSeparate.length + " lines");
  for(int i = 0; i < linesSeparate.length; i++){
    println(linesSeparate[i]);
  }
  
} 
void draw() {
  translate(x, y);
  rotate(radians(270));
  for(int j = 0; j < linesSeparate.length; j++){
     fill(255);
     ellipse(amplitude*float(linesSeparate[j]), j, 5,5);
  }
}
