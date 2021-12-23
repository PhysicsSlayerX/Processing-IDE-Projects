int xx; // X-coordinate of the center
int yy; // Y-coordinate of the bottom
int x;
int y;
int a = 500; // Half the width of the top bar
int n = 10; // Number of recursions
int aD= 5;
void setup() {
  fullScreen();
  //size(500, 500);
  noLoop();
  xx = width/2;
  yy = height;
}
void draw() {
  translate(xx,yy);
  drawT(x, y, a, n, aD);
}
void drawT(int x, int y, int apex, int num, int apexDivider) {
  line(x, y, x, y-apex/apexDivider);
  line(x-apex/apexDivider, y-apex/apexDivider, x+apex/apexDivider, y-apex/apexDivider);
  // This relational expression must eventually be
  // false to stop the recursion and draw the lines
  if (num > 0) {
    drawT(x-apex, y-apex, apex/2, num-1, apexDivider);
    drawT(x+apex, y-apex, apex/2, num-1, apexDivider);
  }
}
