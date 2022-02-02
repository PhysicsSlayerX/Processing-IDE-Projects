
Buttons[] button;
float pos_x,pos_y,dim_w,dim_h;
int colorR,colorG,colorB,colorAlpha;
int buttonCount = 4;


void setup(){
  size(900, 900);
  button = new Buttons[buttonCount];
  for (int i = 0; i < button.length; i++){
     pos_x = random(-width/2, width/2);
     pos_y = random(-height/2, height/2);
     dim_w = 100;
     dim_h = 50;
     colorR = 200;
     colorG = 150;
     colorB = 100;
     colorAlpha = 50;
     button[i] = new Buttons(pos_x, pos_y, dim_w, dim_h, 
                             colorR, colorG, colorB, 
                             colorAlpha);
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  for (int i = 0; i < button.length; i++){
    button[i].buttonDisplay();
  }
  float mouseXrel = map(mouseX, 0,width, -width/2, width/2);
  float mouseYrel = map(mouseY, 0,height, -height/2, height/2);
  for (int i = 0; i < button.length; i++){
    if ((mousePressed == true) && (mouseButton == LEFT) && 
        mouseXrel > button[i].x && 
        mouseXrel < button[i].x + button[i].w && 
        mouseYrel > button[i].y &&
        mouseYrel < button[i].y + button[i].h){
  
        fill(255,255,255);
        rect(button[i].x, button[i].y, button[i].w, button[i].h);
    }
  }
  
 
}
