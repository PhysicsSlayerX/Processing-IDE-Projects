Mover[] movers = new Mover[500];
 
void setup() {
  size(750,750);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}
 
void draw() {
  fill(0, 50);    //persistence of vision effect
  rect(0, 0, width, height);
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
