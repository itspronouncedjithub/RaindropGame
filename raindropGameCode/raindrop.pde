class Raindrop {
  //declaring all information (fields) contained within the raindrop class
  PVector loc, vel, acc;                                                //intialize pvectors
  int diam;                                                             //declare diameter
  color c;                                                              //declare color variable

  //this is a constructor. you can have more than one constructor for a given class
  Raindrop(float x, float y) {
    diam = 20;                                                          //set diameter
    loc = new PVector(x, y);                                            //set location vector
    vel = new PVector(0, 0.5);                                          //set velocity vector
    acc = new PVector(0, .1);                                           //set acceleration vector
    c = color(200, 200, 255, 200);                                      //set color
    loc.add(vel);                                                       //add velocity to location
  }

  void fall() {                                                         //create new command to make drop fall
    loc.add(vel);                                                       //add velocity to location
    vel.add(acc);                                                       //add acceleration to velocity
  }

  void display() {                                                      //create new command to display drop
    fill(c);                                                            //set color
    noStroke();                                                         //delete outline
    ellipse(loc.x, loc.y, diam, diam);                                  //set ellipse to show drop
  }

  boolean isInContactWith(PVector mouse) {                              //if drop is in contact with mouse, return true
    if (loc.dist(mouse) < diam/2 + b.diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {                                                        //create new command to reset the drop's position
    loc = new PVector(random(diam, width-diam), 0);                     //reset location
    vel = new PVector(0, 0.5);                                          //reset velocity
    acc = new PVector(0, 0.1);                                          //reset acceleration
  }
}