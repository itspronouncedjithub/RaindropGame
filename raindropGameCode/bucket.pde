class Bucket {
  PVector loc;
  float diam;
  color c;

  Bucket (int tDiam) {
    diam = tDiam;
    loc = new PVector(mouseX, mouseY);
    c = color(155);
  }
  void display () {
    fill(255, 100, 0);
    ellipse(mouseX, mouseY, diam, diam);
    fill(255);
  }
}