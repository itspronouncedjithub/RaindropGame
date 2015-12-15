class Raindrop {
 //declaring all information (fields) contained within the raindrop class
  PVector loc, vel, acc;
  int diam;
  color c;

//this is a constructor. you can have more than one constructor for a given class
  Raindrop(float x,float y) {
    diam = 100;
    loc = new PVector(random(diam,width-diam),0);
    vel = new PVector(0,3);
    acc = new PVector(0,0.1);
    c = color(random(200,255), random(200,255), random(200,255));
    loc.add(vel);
  }

  void fall() {
    loc.add(vel);
    vel.add(acc);
  }

  void display() {
    fill(c);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(PVector mouse){
    if(loc.dist(mouse) < diam/2) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void reset() {
    loc = new PVector(random(diam,width-diam),0);
    vel = new PVector(0,3);
    acc = new PVector(0,0.1);
  }
}