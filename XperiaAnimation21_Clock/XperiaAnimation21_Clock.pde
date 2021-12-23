float x, y, z, inc, inc1;
float milliSeconds, timeSecond, timeMinute, timeHour;
float hourCoor1, hourCoor2;
float minuteCoor1, minuteCoor2;
float secondCoor1, secondCoor2;
float setSecond, setMinute, setHour;
int ss = 0; 
int mm = 59;
int hh = 10;
int n = 10;

void setup() {
  size(900, 900, P2D);
  orientation(PORTRAIT);
  smooth();
  noFill();
  frameRate(120);
  x = width/2;
  y = height/2;
  //ser hour time, from 0-360
}
void draw() {
 
  int[] hourScale = new int[13];
  for (int i = 1; i < 13; i++) {
    hourScale[i] = i;
  }

  setSecond = 90-ss*6 ;//set second time, from 0-360
  setMinute = 90-mm*6 ;//set minute time, from 0-360
  setHour = 90-hh*30 ;
  background(0);
  translate(x, y);
  //scale(1.2);
  //inc++;
  milliSeconds = millis()*25;
  timeSecond = floor(milliSeconds/1000)*6;
  timeMinute = floor(milliSeconds/60000)*6;
  timeHour = floor(milliSeconds/3600000)*6;
  secondCoor1 = 400*cos(radians(timeSecond-setSecond));
  secondCoor2 = 400*sin(radians(timeSecond-setSecond));
  minuteCoor1 = floor(360*cos(radians(timeMinute-setMinute)));
  minuteCoor2 = floor(360*sin(radians(timeMinute-setMinute)));
  hourCoor1 = 200*cos(radians(timeHour-setHour));
  hourCoor2 = 200*sin(radians(timeHour-setHour));
  //println(timeSecond);
  //println(timeMinute);
  //println(timeHour);
  secondHand();
  minuteHand();
  //println(hourScale[n]);
  if ((minuteCoor1 == 0.0 && minuteCoor2 == -360.0) && hh == hourScale[n]) {
    n = hh + 1;
    println(hourScale[n]);
  }
  println(hh);

  hourHand();
}

void secondHand() {
  stroke(255, 0, 0);
  strokeWeight(12);
  line(0, 0, secondCoor1, secondCoor2);
  stroke(255, 0, 0);
  strokeWeight(4);
  ellipse(0, 0, width-200, width-200);
}
void minuteHand() {
  stroke(0, 255, 0);
  strokeWeight(15);
  line(0, 0, minuteCoor1, minuteCoor2);
  stroke(0, 255, 0);
  strokeWeight(8);
  ellipse(0, 0, width-150, width-150);
}
void hourHand() {
  stroke(0, 0, 255);
  strokeWeight(25);
  line(0, 0, hourCoor1, hourCoor2);
  stroke(0, 0, 255);
  strokeWeight(15);
  ellipse(0, 0, width-100, width-100);
}
