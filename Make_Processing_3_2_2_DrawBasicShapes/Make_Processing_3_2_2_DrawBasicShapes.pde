
//line(x1,y1,x2,y2)
//triangle(x1,y1,x2,y2,x3,y3)
//quad(x1,y1,x2,y2,x3,y3,x4,y4)
//rect(x,y,width, height)
//ellipse(x,y, width, height)
//arc(x,y,width, height, start,stop)

size(480, 480);
line(20, 50, 420, 310);

quad(158, 55, 199, 14, 392, 66, 351, 107);
triangle(347, 54, 392, 9, 392, 66);
triangle(158, 55, 290, 91, 290, 112);
rect(180, 260, 220, 40);
ellipse(278, 400, 40, 40);
ellipse(78, 400, 40, 100);

arc(90, 220, 80, 80, 0, HALF_PI);
arc(180, 220, 80, 80, 0, PI+HALF_PI);
arc(290, 220, 80, 80, PI, TWO_PI+HALF_PI);
arc(390, 220, 80, 80, QUARTER_PI, PI+QUARTER_PI);
arc(90, 330, 80, 80, PI, PI+0.1);

//draw with degrees:

arc(390, 390, 80, 80, 0, radians(90));
arc(390, 350, 80, 80, radians(45), radians(225));
