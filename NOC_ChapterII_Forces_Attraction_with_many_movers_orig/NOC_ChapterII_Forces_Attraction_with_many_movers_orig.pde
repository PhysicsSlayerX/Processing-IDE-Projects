// Now we have 10 Movers!
Mover[] movers = new Mover[10];

Attractor a;

void setup() {
  size(400,400);
  for (int i = 0; i < movers.length; i++) {
    //[offset-down] Each Mover is initialized randomly.
    movers[i] = new Mover(random(0.1,2),random(width),random(height));
  }
  a = new Attractor();
}

void draw() {
  background(255);

  a.display();

  for (int i = 0; i < movers.length; i++) {
    // We calculate an attraction force for each Mover object.
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].display();
  }

}
