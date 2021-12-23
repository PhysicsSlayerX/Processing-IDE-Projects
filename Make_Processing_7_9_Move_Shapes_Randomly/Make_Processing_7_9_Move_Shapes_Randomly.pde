float speed = 12.5;
int diameter = 20;
float x, y, shape_var1;
int color_var;



void setup() {
  size(960, 1080);
  smooth();
  x = width/2;
  y = height/2;
}

void draw() {
  x += random(-speed, speed);
  y += random(-speed, speed);
  color_var = int(random(0, 255));
  shape_var1 += random(-speed, speed);
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);

  shape_var1 = constrain(shape_var1, 5, diameter);
  fill(x, y, color_var);
  stroke(y, color_var, x, 100);
  ellipse(x, y, shape_var1, shape_var1);
  fill(color_var, y, x);
  stroke(y, color_var, x, 150);
  ellipse(y, x, shape_var1, shape_var1);
  stroke(y, color_var, x, 20);
  strokeWeight(1);
  line(x, y, color_var, shape_var1);
  line(y, x, shape_var1, color_var);
}
