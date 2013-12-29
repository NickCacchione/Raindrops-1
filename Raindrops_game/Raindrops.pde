class Raindrops {
  PVector loc;                                     //PVector for the location of the raindrop
  PVector vel;                                     //PVector for the velocity of the raindrop
  PVector acc;                                     //PVector for the acceleratin of the raindrop
  float d;                                         //variable for determining the size of raindrop
  PImage raindrop;                                 //image for the raindrop
  boolean active;                                  //boolean to set the raindrop as active or inactive, similar to an on/off switch


  Raindrops() {                                         
    loc = new PVector (random(width), 0);           //set the location for the raindrop
    vel = new PVector (0, 0);                       //set the velocity for the raindrop
    acc = new PVector (0, random(.03, .05));        //set the acceleration for the raindrop
    d = random(10, 20);                             //set random size for the raindrop with a minimum and maximum
    raindrop = loadImage("raindrop.png");           //load the raindrop image
    active = true;                                  //declare the drop to be active
  }

  void displayImage () {                            //creating a method to display picture of raindrop                                
    imageMode(CENTER);                              //centers raindrop image
    image(raindrop, loc.x, loc.y, d, d);            //sets the size and location of the raindrop image
  }

  void display() {                                //method for a circle to fall instead of a raindrop image
    fill(0, 0, 255);                              //color to fill circle
    ellipse(loc.x, loc.y, d, d);                  //sets the size and location of the circle
  }

  void fall() {                                  //creating a method to make the raindrop fall with a velocity and acceleration
    vel.add(acc);                                //as the velocity increases, the acceleration increases, causing the raindrop to fall faster
    loc.add(vel);                                //as the location increases, it adds to the velocity
  }

  void check(Catcher c1) {                       //method to check the catcher against a raindrop
    if (active) {                                //if the rain drop is active the following will happen:
      if (loc.dist(c1.loc) < d/2 + c1.d/2) {     //if the distance between the radii is less than the radii added together ( it is caught ) 
        vel.set(0, 0);                           //set the velocity to zero
        acc.set(0, 0);                           //set the acceleration to zero
        loc.y = height*-2;                       //move the raindrop to up, twice the height of the display
        score++;                                 //increase the score
        if (score%10 == 0) {                     //if the score is divisible by ten, decrease the time it takes to make a raindrop fall 
          t-= 50;                                //decrease the time interval by fifty milliseconds
        }
        c1.caught = true;                        //the caught method is true
        active = false;                          //the raindrop is now inactive
      }
      if (loc.y >= height) {                     //if the location of the raindrop is greater than or equal to the height
        c1.caught = false;                       //the caught method is false
        active = false;                          //the raindrop is inactive
        lives--;                                 //if a raindrop is not caught, the lives variable decreases by one
        if(lives == 0 ){                         //if the lives variable is equal to zero..
         gameover = true;                        //the boolean variable fameover is true
         start = false;                          //the boolean variable start is false
  
        }
      }
    }
  }
}

