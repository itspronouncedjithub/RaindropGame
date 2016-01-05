class Raindrop {
  //declaring all information (fields) contained within the raindrop class
  PVector loc, vel, acc;
  int diam;
  color c;

  //this is a constructor. you can have more than one constructor for a given class
  Raindrop(float x, float y) {
    diam = 50;  
    loc = new PVector(random(diam, width-diam), 0);
    vel = new PVector(0, 0.5);
    acc = new PVector(0, .1);
    c = color(255, 255, 255, 20);
    loc.add(vel);
  }

  void fall() {
    loc.add(vel);
    vel.add(acc);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(PVector mouse) {
    if (loc.dist(mouse) < diam/2 + b.diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void resetFalse() {
    loc = new PVector(random(diam, width-diam), 0);
    vel = new PVector(0, 0.5);
    acc = new PVector(0, 0.1);
  }
  void resetTrue() {
    loc = new PVector(random(diam, width-diam), 0);
    vel = new PVector(0, 0.5);
    acc = new PVector(0, 0.1);
    acc.mult(1.5);
  }
}