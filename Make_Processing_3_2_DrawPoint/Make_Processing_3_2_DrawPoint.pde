PImage img;

int xpoint = 349;
int ypoint = 349;

void setup()
{
  size(700,700);
  smooth();
  //point(239,239); //creates a point located at x=239, y-239
  background(0,0,0);
  
}

void draw(){
  for(int i = 0; i <= 700*700; i++){
    stroke(255);
    int x = xpoint;
    int y = ypoint;
    //point(x,y);
    //point(x + i*3, y + i*3);
    point(x + round((i/350)*sin(i)), y - round((i/350)*cos(i)));
    point(x + round((i/350)*sin(i)), y + round((i/350)*cos(i)));
  }
  int xpoint_2 = xpoint;
  while(xpoint_2 == xpoint){
    xpoint_2 = xpoint_2 - 1;
    //stroke(0);
    //fill(255);
    //ellipse(349,349, 100,50);
    img = loadImage("humanbrain.png");
    image(img, 349/2, 349/1.5, width/2, height/3.5);
    String s1 = "Di gumagana kapag:";
    String s2 = "Exam sa Math";
    fill(0);
    textSize(50);
    text(s1, 100, 180, 700, 700);  // Text wraps within text box
    fill(0);
    textSize(95);
    text(s2, 30, 400, 700, 700);
  }
  
  //fill(0);
  //ellipse(349,349, 50,50);
}



// line(50,50,80,80); //length_x, lenght_y, position_x, position_y 
