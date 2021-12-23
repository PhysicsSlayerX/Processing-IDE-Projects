class Grids{
  float spacing;
  float horizontal_grid;
  float vertical_grid;
  float mouseScrollCounter;
  Grids(float h, float v, float tempSpacing){
    horizontal_grid = h;
    vertical_grid = v;
    spacing = tempSpacing;
  }
  
  void gridDisplay(){
    pushMatrix();
    for(float i = horizontal_grid;
            i < -(horizontal_grid);
            i +=spacing){
               stroke(144,100);
               strokeWeight(1);
               line(i,horizontal_grid,i,-horizontal_grid);
               strokeWeight(3);
               line(horizontal_grid, 0, -horizontal_grid,0); 

    }
    for(float i = vertical_grid;
            i < -(vertical_grid);
            i +=spacing){
               stroke(144,100);
               strokeWeight(1);
               line(vertical_grid,i, -vertical_grid,i);
               stroke(255,150);
               strokeWeight(3);
               line(0, vertical_grid, 0,-vertical_grid);
    }
    
    fill(255,0,0);
    noStroke();
    ellipse(0,0,6,6);
    popMatrix();
  }
  void textDisp(){
    
    pushMatrix();
    scale(1,-1);
    rotate(radians(360));
    for(float i = horizontal_grid;
            i < -horizontal_grid;
            i +=spacing){
               fill(255);
               textSize(20);
               int remapped = int(map(i, horizontal_grid,-horizontal_grid, horizontal_grid/spacing,-horizontal_grid/spacing));
               if(remapped == 0){
                   fill(0);
               }
               text(remapped, i+5, 20);
               
               
    }
    for(float i = vertical_grid;
            i < -vertical_grid;
            i +=spacing){
               fill(255);
               textSize(20);
               int remapped = int(map(i, -vertical_grid,vertical_grid, vertical_grid/spacing,-vertical_grid/spacing));
               if(remapped == 0){
                   fill(0);
               }
               text(remapped,-30, i+5);
            
    }
    popMatrix();
    fill(255);
    textSize(20);
    text("O", 10,-10);
  }
}
