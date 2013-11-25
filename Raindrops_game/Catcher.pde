class Catcher {
  PVector loc;
  float d;

  Catcher() {
    loc = new PVector (mouseX, height/2);
    d = 20;
  }

  void display() {
    fill(255)
    ellipse(loc.x, loc.y, d, d);
  }
}

