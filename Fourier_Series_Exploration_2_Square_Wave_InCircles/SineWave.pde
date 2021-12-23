class SineWave {
  float n;
  float x;
  float L;
  float An; 
  float speed;
  float y;
  float diameter;
  float motion_X1, motion_X2, motion_X3;
  float motion_Y1, motion_Y2, motion_Y3;
  float ampDiv;
  //float nextTerm;

  SineWave(float temp_n, float temp_x, float temp_y, float temp_L, float temp_An, float temp_speed, float temp_diameter, float temp_ampDiv) {
    n = temp_n;
    x = temp_x;
    y = temp_y;
    L = temp_L;
    An = temp_An;
    speed = temp_speed;
    diameter = temp_diameter;
    ampDiv = temp_ampDiv;
  }

  void OrbitalSineWave() {
    x += speed;
    y += speed;
    motion_X1 = SineFunction(x);
    motion_X2 = MultipleSineFunction(x);
    motion_X3 = AdditionSineFunction(x);
    motion_Y1 = CosFunction(y);
    motion_Y2 = MultipleSineFunction(y);
    motion_Y3 = AdditionSineFunction(y);
  } 
  void OrbitalDisplay() {
    print("Sine: " + motion_X1 + ", ");
    print("Two Sines: " + motion_X2 + ", "); 
    println("Three Sines: " + motion_X3 + ", ");
    fill(255, 0, 0, 50);
    stroke(255, 0, 0,150);
    ellipse(motion_X1, motion_Y1, diameter, diameter);
    fill(0, 255, 0,50);
    stroke(0, 255, 0,150);
    ellipse(motion_X2, motion_Y2, diameter, diameter);
    fill(0, 0, 255,50);
    stroke(0, 0, 255,150);
    ellipse(motion_X3, motion_Y3, diameter, diameter);
  }
  float SineFunction(float motionValue) {
    float motionX = (An/ampDiv)*sin(n*PI*radians(motionValue)/L);
    return motionX;
  }
  float CosFunction(float motionValue) {
    float motionX = (An/ampDiv)*cos(n*PI*radians(motionValue)/L);
    return motionX;
  }

  float MultipleSineFunction(float motionValue) {
    float AddedSineMotion = (An/ampDiv)*sin((n+2)*PI*radians(motionValue)/L)+SineFunction(x);
    return AddedSineMotion;
  }
  float MultipleCosFunction(float motionValue) {
    float AddedCosMotion = (An/ampDiv)*cos((n+2)*PI*radians(motionValue)/L)+CosFunction(y);
    return AddedCosMotion;
  }
  float AdditionSineFunction(float motionValue) {
    float AddedSineMotion = (An/ampDiv)*sin((n+4)*PI*radians(motionValue)/L)+MultipleSineFunction(x);
    return AddedSineMotion;
  }
   float AdditionCosFunction(float motionValue) {
    float AddedCosMotion = (An/ampDiv)*cos((n+4)*PI*radians(motionValue)/L)+MultipleCosFunction(y);
    return AddedCosMotion;
  }
}
