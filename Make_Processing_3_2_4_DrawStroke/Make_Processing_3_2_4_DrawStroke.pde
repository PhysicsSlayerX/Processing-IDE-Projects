
size(480,480);
smooth();

strokeWeight(40);
strokeJoin(ROUND); //Round the stroke corners

rect(40,25,70,70);
strokeJoin(BEVEL); //Bevel the stroke corners
rect(140, 25,70,70);
strokeCap(SQUARE); //Square the line endings
line(270,25, 340, 95);
strokeCap(ROUND); //Round the line endings
line(350, 25, 420, 95);
