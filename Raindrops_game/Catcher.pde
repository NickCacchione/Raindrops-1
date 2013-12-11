class Catcher {
  float d;
  PVector loc;
  PImage kid;
  PImage happykid;
  boolean caught;

  Catcher() {                                              
    loc = new PVector (width/2, height*.75);                //set the location for the catcher
    d = 75;                                                 
    kid = loadImage("wet kid.png");                          //declare one image for the catcher
    happykid = loadImage("happykid.png");                   //declare the other image for the catcher
  }
  void display() {
    loc.set(mouseX, height*.75);                           //set the location for the catcher
    fill(255);
    if (caught) {                                          //if a raindrop is caught, the catcher is one image   
      image(kid, loc.x, loc.y, 200, 175);
    }
    else {                                                 //if the raindrop is not caught, the catcher is the other image
      image(happykid, loc.x, loc.y, 200, 175);
    }
  }
}

