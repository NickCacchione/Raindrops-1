class Catcher {
  float d;                                                  //variable used to determine the area within the picture that can catch a raindrop
  PVector loc;                                              //PVector for the location of the catcher
  PImage kid;                                               //one image for the catcher
  PImage happykid;                                          //the second image for the catcher
  boolean caught;                                           //value used to make the image change whether or not the raindrop is caught

  Catcher() {                                              
    loc = new PVector (width/2, height*.75);                //set the location for the catcher
    d = 75;                                                 //value set to variable
    kid = loadImage("wet kid.png");                         //declare one image for the catcher
    happykid = loadImage("happykid.png");                   //declare the other image for the catcher
  }
  void display() {
    loc.set(mouseX, height*.75);                           //set the location for the catcher
    if (caught) {                                          //if a raindrop is caught, the catcher is one image   
      image(kid, loc.x, loc.y, 200, 175);
    }
    else {                                                 //if the raindrop is not caught, the catcher is the other image
      image(happykid, loc.x, loc.y, 200, 175);
    }
  }
}

