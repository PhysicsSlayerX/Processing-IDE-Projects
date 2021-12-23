class SineWave {
  float n;
  float x;
  float L;
  float An; 
  float speed;
  float y;
  float diameter;
  float motion_X1, motion_X2, motion_X3, motion_X4;
  float ampDiv;
  float shiftWaveX, shiftWaveY;
  //float nextTerm;

  SineWave(float temp_n, float temp_x, float temp_L, float temp_An, float temp_speed, 
    float temp_diameter, float temp_ampDiv, float temp_shiftWaveX, float temp_shiftWaveY) {
    //SineWave(n, x, L, An, speed, diameter, ampDiv, shiftWaveX,shiftWaveY)
    n = temp_n;
    x = temp_x;
    L = temp_L;
    An = temp_An;
    speed = temp_speed;
    diameter = temp_diameter;
    ampDiv = temp_ampDiv;
    shiftWaveX = temp_shiftWaveX;
    shiftWaveY = temp_shiftWaveY;
    y = shiftWaveY; //shifts the starting postion of the graph to the right.
  }

  void OrbitalSineWave() {

    x += speed;
    y += speed;
    motion_X1 = SineFunction(x) + shiftWaveX; //moves the graph up and down, due to rotate(270) code.
    motion_X2 = MultipleSineFunction(x) + shiftWaveX; //moves the graph up and down, due to rotate(270) code.
    motion_X3 = AdditionSineFunction(x) + shiftWaveX; //moves the graph up and down, due to rotate(270) code.
    motion_X4 = DampedSineFunction(x) + shiftWaveX; //moves the graph up and down, due to rotate(270) code.
  } 
  void OrbitalDisplay() {
    translate(0, x2);
    rotate(radians(270));
    print("Sine: " + motion_X1 + ", ");
    print("Two Sines: " + motion_X2 + ", "); 
    println("Three Sines: " + motion_X3 + ", ");
    fill(255, 0, 0, 50);
    stroke(255, 0, 0, 150);
    ellipse(motion_X1, y, diameter, diameter);
    fill(0, 255, 0, 50);
    stroke(0, 255, 0, 150);
    ellipse(motion_X2, y, diameter, diameter);
    fill(0, 0, 255, 50);
    stroke(0, 0, 255, 150);
    ellipse(motion_X3, y, diameter, diameter);
    fill(0, 255, 255, 50);
    stroke(0, 255, 255, 150);
    ellipse(motion_X4, y, diameter, diameter);
  }
  float SineFunction(float motionValue) {
    float motionX = (An/ampDiv)*sin(n*PI*radians(motionValue)/L);
    return motionX;
  }
  float MultipleSineFunction(float motionValue) {
    float AddedSineMotion = (An/ampDiv)*sin((n+2)*PI*radians(motionValue)/L)+SineFunction(x);
    return AddedSineMotion;
  }
  float AdditionSineFunction(float motionValue) {
    float AddedSineMotion = (An/ampDiv)*sin((n+4)*PI*radians(motionValue)/L)+MultipleSineFunction(x);
    return AddedSineMotion;
  }
  float DampedSineFunction(float motionValue) {
    float AddedSineMotion = ((An/ampDiv))*sin((n+6)*PI*radians(motionValue)/L)+AdditionSineFunction(x);
    return AddedSineMotion;
  }
}
