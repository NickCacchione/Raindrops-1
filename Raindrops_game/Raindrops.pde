class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  float d;
  PImage raindrop;


  Raindrops() {
    loc = new PVector (random(width), random(height));
    vel = new PVector (0, 0);
    acc = new PVector (0, random(.03,.05));
    d = random(10,20);
    raindrop = loadImage("raindrop.png");
  }

  void display () {
    fill(0,0,255);
    imageMode(CENTER);
    ellipse (raindrop, loc.x, loc.y, d, d);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  void restart() {
    if ( loc.y + d/2 > height) {
      loc.y = 0;
      vel.set(0, 0);
    }
  }
}
