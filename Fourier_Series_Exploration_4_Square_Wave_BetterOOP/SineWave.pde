class SineWave {
  float An, n, xAxis, L, ampDiv;
  float angF, Ts, funcDisp, cFuncDisp;
  float totalDisp, dmpCoeff;
  float ampAdd, ampAddScalar;
  float speed;
  float motionValue;
  float y;
  float diameter;
  float xAxisCoeff;

  SineWave(float temp_An, float temp_n, 
    float temp_xAxis, float temp_L, 
    float temp_ampDiv, float temp_angF, 
    float temp_Ts, float temp_funcDisp, 
    float temp_cFuncDisp, float temp_totalDisp, 
    float temp_dmpCoeff, float temp_ampAdd, 
    float temp_ampAddScalar, float temp_diameter, float temp_xAxisCoeff) {
    An = temp_An;
    n = temp_n;
    xAxis = temp_xAxis;
    L = temp_L;
    ampDiv = temp_ampDiv;
    angF = temp_angF;
    Ts = temp_Ts;
    funcDisp = temp_funcDisp;
    cFuncDisp = temp_cFuncDisp;
    totalDisp = temp_totalDisp;
    dmpCoeff = temp_dmpCoeff;
    ampAdd = temp_ampAdd;
    ampAddScalar = temp_ampAddScalar;
    diameter = temp_diameter;
    xAxisCoeff = temp_xAxisCoeff;
    speed = 0.1;
    y = 10;
  }
  void update() {

    xAxis += speed;
    xAxisCoeff += speed;
    y += speed;
    motionValue = Sine(xAxis);
  }
  void display() {
    noStroke();
    ellipse(motionValue, y, diameter, diameter);
  }

  float Sine(float indValue) {
    float sineValue = (exp(dmpCoeff*xAxisCoeff)*((An/ampDiv) - ampAdd*ampAddScalar)*((sin((radians((n*indValue)/L)))
      + (angF*Ts)) + funcDisp*cFuncDisp) + totalDisp); 

    //no need for PI, as it converts n*indValue with radian measure
    //Change to degrees() and put PI inside - shows a very nice graph
    return sineValue;
  }
}
