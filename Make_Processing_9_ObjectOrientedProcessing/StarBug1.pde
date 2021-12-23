class StarBug1 {
  float x;
  float y;
  int diameter;
  float speed; // from 1 - 10 only
  float amplitude;
  float frequency;
  float time;
  float k_const;

  StarBug1(float tempX, float tempY, int tempDiameter, 
    float tempSpeed, float tempAmplitude, 
    float tempFrequency, float tempTime, float tempk_const) {

    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speed = tempSpeed;
    amplitude = tempAmplitude;
    frequency = tempFrequency;
    time = tempTime;
    k_const = tempk_const;
  }

  void starMove() {
    x += speed;
    y += speed;
  }
  void starDisplay() {
    //float cosFunc = amplitude*cos(k_const*speed + frequency*time);
    //float sinFunc = amplitude*sin(k_const*speed - frequency*time);
    fill(random(100, speed*25));
    stroke(random(100, speed*25));
    ellipse(x, y, diameter, diameter);
  }
}
