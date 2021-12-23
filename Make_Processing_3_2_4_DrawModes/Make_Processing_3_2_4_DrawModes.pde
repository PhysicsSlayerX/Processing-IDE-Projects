
size(500,500);
smooth();

rectMode(CORNER); //default rectMode is CORNER
rect(25,25,50,50);

rectMode(CORNERS); //rectMode(CORNERS) interprets the first
                   //two parameters of rect() as the location 
                   //of one corner, and the third and fourth parameters 
                   //as the location of the opposite corner.

fill(100);
rect(25,25, 50,50);

rectMode(RADIUS); //rectMode(RADIUS) also uses the first 
                  //two parameters of rect() as the shape's center point,
                  //but uses the third and fourth parameters to 
                  //specify half of the shapes's width and height.

fill(255);
rect(120,120,40,40);

rectMode(CENTER); //rectMode(CENTER) interprets the first two
                  //parameters of rect() as the shape's center point, 
                  //while the third and fourth parameters are 
                  //its width and height.
fill(100);
rect(120,120,40,40);

ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
fill(255);  // Set fill to white
ellipse(250, 250, 30, 30);  // Draw white ellipse using RADIUS mode

//ellipseMode(RADIUS) also uses the first two parameters of ellipse() 
//as the shape's center point, but uses the third and 
//fourth parameters to specify half of the shapes's width and height.

ellipseMode(CENTER);  // Set ellipseMode to CENTER
fill(100);  // Set fill to gray
ellipse(250, 250, 30, 30);  // Draw gray ellipse using CENTER mode

//The default mode is ellipseMode(CENTER), which interprets the 
//first two parameters of ellipse() as the shape's center point,
//while the third and fourth parameters are its width and height.
ellipseMode(CORNER);  // Set ellipseMode is CORNER
fill(255);  // Set fill to white
ellipse(325, 325, 50, 50);  // Draw white ellipse using CORNER mode

//ellipseMode(CORNER) interprets the first two parameters of ellipse()
//as the upper-left corner of the shape, while the third and fourth 
//parameters are its width and height.

ellipseMode(CORNERS);  // Set ellipseMode to CORNERS
fill(100);  // Set fill to gray
ellipse(325, 325, 350,350 );  // Draw gray ellipse using CORNERS mode

//ellipseMode(CORNERS) interprets the first two parameters of ellipse()
//as the location of one corner of the ellipse's bounding box, and the 
//third and fourth parameters as the location of the opposite corner.
