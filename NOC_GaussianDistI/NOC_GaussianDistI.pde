
//Solving for Standard Deviation
int elementCount = 100;
float[] array = new float[elementCount];                  //Initialize an array
float[] diffmean = new float[elementCount];
float[] squarediffmean = new float[elementCount];
float[] sortedArray = new float[elementCount];
int counterSum;                                           //Set a counter
int counterVar;                                           //Set a counter
float sum;
float mean;
float sumVariance;
float standardVar;


void setup(){
  size(700,500);
  background(0);
  //array[0] = 1;
  for (int i = 0; i < array.length; i++){
    array[i] = random(0,height);
  }
  for (int i = 0; i < array.length; i++){
    print(array[i],",");
  }
  while (counterSum < array.length){                       //Find the sum
    sum = sum + array[counterSum];
    counterSum++;
  }
  println(sum);
  
  mean = sum/(array.length-1);
  
  
  for (int i = 0; i < array.length; i++){                  //Difference from the mean
    diffmean[i] = array[i]-mean;
  }
  for (int i = 0; i < diffmean.length; i++){
    print(diffmean[i], ",");
  }
  for (int i = 0; i < squarediffmean.length; i++){         //Variance
    squarediffmean[i] = pow(diffmean[i],2.0);
  }
  for (int i = 0; i < squarediffmean.length; i++){
    print(squarediffmean[i], ",");
  }
  
  while (counterVar < squarediffmean.length){              //Find the sum
    sumVariance = sumVariance + squarediffmean[counterVar];
    counterVar++;
    println(sumVariance);
  }
  println(sumVariance);                                    //Calculating the Standard Deviation
  standardVar = sqrt(sumVariance);
  println(standardVar);
  println(mean);
  println(array.length);
  println(width);
  
  sortedArray = sort(array);
  //println(sortedArray);
  
//Plot the distribution
  /*translate(0,height);
  scale(1,-1);
  fill(0,120);
  noStroke();
  float boxWidth = width/array.length;
  //println(boxWidth);
  for (int i = 0; i < array.length;i++){
    rect(i*boxWidth,0,boxWidth/1.01,array[i]);
  }
   for (int i = 0; i < array.length;i++){
    rect(i*boxWidth,0,boxWidth/1.01,sortedArray[i]);
  }
  */
}
void draw(){                     //Trying Normal Distribution using 
                                 //normal random function 
                                 //(which doesn't show Gaussian)
 
 float num = random(0,height);
 float sd = standardVar;
 float x = sd*num+mean;
 translate(width/2,height/2);
 scale(1,-1);
 noStroke();
 fill(255,70);
 ellipse(x/2500,0,50,50);
}
