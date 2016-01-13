class Bucket {
  PVector loc;                                                          //initialize location pvector
  float diam;                                                           //float diameter
  color c;                                                              //declare color

  Bucket (int tDiam) {
    diam = tDiam;                                                       //set another variable equal to diameter
    loc = new PVector(mouseX, mouseY);                                  //set pvector to mouse coords
    c = color(155);                                                     //set color variable
  }
  void display () {                                                     //create new command to display bucket
    fill(255, 100, 0);                                                  //set color
    ellipse(mouseX, mouseY, diam, diam);                                //set bucket location and size
    fill(255);                                                          //set color
  }
}