PImage mainPage, heroesPage, bombingPage, chestHeroPage, chestPage, advPage, restAllPage;

Buttons[] button;
float pos_x,pos_y,dim_w,dim_h;
int colorR,colorG,colorB,colorAlpha;
int buttonCount = 11;
int[] positionX_start = {69, 255 , 600 ,575, 371, 12, 365, 248, 343, 486,287};
int[] positionY_start = {108, 110 , 5 ,328, 328,10, 59, 100, 62, 62,100};
int[] positionX_end   = {212, 402 , 631 ,621, 416, 50, 393, 282, 370, 513,325};
int[] positionY_end   = {301, 302, 37 ,390, 390, 40, 91, 115, 89, 91,116};
boolean mainPage_switch      = true;
boolean heroesPage_switch    = false;
boolean bombingPage_switch   = false;
boolean ChestHeroPage_switch = false;
boolean chestPage_switch     = false;
boolean advPage_switch       = false;
boolean restAllPage_switch   = false;

void setup(){
  size(644, 405);
  button = new Buttons[buttonCount];
  for (int i = 0; i < button.length; i++){
     pos_x = positionX_start[i] - width/2;
     pos_y = positionY_start[i] - height/2;
     dim_w = positionX_end[i] - positionX_start[i];
     dim_h = positionY_end[i] - positionY_start[i];
     colorR = 200;
     colorG = 150;
     colorB = 100;
     colorAlpha = 50;
     button[i] = new Buttons(pos_x, pos_y, dim_w, dim_h, 
                             colorR, colorG, colorB, 
                             colorAlpha);
  }
  mainPage      = loadImage("MainpageBC.png");
  heroesPage    = loadImage("HeroesPage.png");
  bombingPage   = loadImage("bombingPage.png");
  chestHeroPage = loadImage("ChestHeroesPage.png");
  chestPage     = loadImage("ChestPage.png");
  advPage       = loadImage("AdvPage.png");
  restAllPage   = loadImage("RestAllPage.png");
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  //Display Pages
  if (mainPage_switch){
    image(mainPage, -width/2, -height/2);
  }
  if (bombingPage_switch){
    image(bombingPage, -width/2, -height/2);
  }
  if (advPage_switch){
    image(advPage, -width/2, -height/2);
  }
  if (ChestHeroPage_switch){
    image(chestHeroPage, -width/2, -height/2);
  }
  if (chestPage_switch){
    image(chestPage, -width/2, -height/2);
  }
  if (heroesPage_switch){
    image(heroesPage, -width/2, -height/2);
  }
  if (restAllPage_switch){
    image(restAllPage, -width/2, -height/2);
  }
  
  
  for (int i = 0; i < button.length; i++){
    button[i].buttonDisplay();
  }
  float mouseXrel = map(mouseX, 0,width, -width/2, width/2);
  float mouseYrel = map(mouseY, 0,height, -height/2, height/2);
  for (int i = 0; i < button.length; i++){
    if ((mouseButton == LEFT) && 
        mouseXrel > button[i].x && 
        mouseXrel < button[i].x + button[i].w && 
        mouseYrel > button[i].y &&
        mouseYrel < button[i].y + button[i].h){
        
        fill(255,0,0,200);
        rect(button[i].x, button[i].y, button[i].w, button[i].h);
        
        //Main Page <-> Bombing Page
        if (mouseXrel > button[1].x && 
            mouseXrel < button[1].x + button[1].w && 
            mouseYrel > button[1].y &&
            mouseYrel < button[1].y + button[1].h){
              
              image(bombingPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = false;
              bombingPage_switch   = true;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Main Page -> Bombing Page");
         }
         if (mouseXrel > button[5].x && 
            mouseXrel < button[5].x + button[5].w && 
            mouseYrel > button[5].y &&
            mouseYrel < button[5].y + button[5].h){
              
              image(mainPage, -width/2, -height/2);
              mainPage_switch      = true;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("To the Main page");
         }
         
         //Main Page <-> Adventure Page
         if (mouseXrel > button[0].x && 
            mouseXrel < button[0].x + button[0].w && 
            mouseYrel > button[0].y &&
            mouseYrel < button[0].y + button[0].h){
              
              image(advPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = true;
              restAllPage_switch   = false;
              println("Main Page -> Adventure Page");
         }
         
         //Main Page <-> Chest Page
         if (mouseXrel > button[2].x && 
            mouseXrel < button[2].x + button[2].w && 
            mouseYrel > button[2].y &&
            mouseYrel < button[2].y + button[2].h){
              
              image(chestPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = true;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Main Page -> Chest Page");
         }
         
         if (mouseXrel > button[9].x && 
            mouseXrel < button[9].x + button[9].w && 
            mouseYrel > button[9].y &&
            mouseYrel < button[9].y + button[9].h){
              
              image(mainPage, -width/2, -height/2);
              mainPage_switch      = true;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Chest Page -> Main Page");
         }
         //Main Page <-> Chest Hero Page
         if (mouseXrel > button[4].x && 
            mouseXrel < button[4].x + button[4].w && 
            mouseYrel > button[4].y &&
            mouseYrel < button[4].y + button[4].h){
              
              image(chestHeroPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = true;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Main Page -> Chest Hero Page");
         }
         
         if (mouseXrel > button[6].x && 
            mouseXrel < button[6].x + button[6].w && 
            mouseYrel > button[6].y &&
            mouseYrel < button[6].y + button[6].h){
              
              image(mainPage, -width/2, -height/2);
              mainPage_switch      = true;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Chest Hero Page -> Main Page");
         }
         
         //Main Page <-> Hero Page
         if (mouseXrel > button[3].x && 
            mouseXrel < button[3].x + button[3].w && 
            mouseYrel > button[3].y &&
            mouseYrel < button[3].y + button[3].h){
              
              image(heroesPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = true;
              bombingPage_switch   = false;
              ChestHeroPage_switch = true;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Main Page -> Hero Page");
         }
         
         if (mouseXrel > button[8].x && 
            mouseXrel < button[8].x + button[8].w && 
            mouseYrel > button[8].y &&
            mouseYrel < button[8].y + button[8].h){
              
              image(mainPage, -width/2, -height/2);
              mainPage_switch      = true;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Hero Page -> Main Page");
         }
         
         //Activate All or Rest All
         if (mouseXrel > button[7].x && 
            mouseXrel < button[7].x + button[7].w && 
            mouseYrel > button[7].y &&
            mouseYrel < button[7].y + button[7].h){
              
              image(restAllPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = false;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = true;
              println("Press All");
         }
         if (mouseXrel > button[10].x && 
            mouseXrel < button[10].x + button[10].w && 
            mouseYrel > button[10].y &&
            mouseYrel < button[10].y + button[10].h){
              
              image(restAllPage, -width/2, -height/2);
              mainPage_switch      = false;
              heroesPage_switch    = true;
              bombingPage_switch   = false;
              ChestHeroPage_switch = false;
              chestPage_switch     = false;
              advPage_switch       = false;
              restAllPage_switch   = false;
              println("Press Rest All");
         }
    }
  }
  
 
}
