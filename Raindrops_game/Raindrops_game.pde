int oldTime = 0;                               //value used to make timer
int index = 1;                                 //vairable used in the array
Raindrops [] drops = new Raindrops [100];      //set array
Catcher catcher1;                              //declare catcher
int score;                                     //variable to work more easily with the score
int textsize;
PImage background;
int t =3000;

void setup() {
  background = loadImage("background1.png");     //background image is set
  size(background.width, background.height);     //size of background
  for (int i = 0; i < drops.length; i++) {       //set an array for the raindrops
    drops[i] = new Raindrops();
  }
  catcher1 = new Catcher();                      //declaring catcher from catcher class
  textsize =40;                                  //set text size for score
}

void draw() {
  background(background);                        //setting the image "background" as the background
  for (int i = 0 ; i < index; i++) {             //as a raindrop from the array falls, it enacts three methods to display the raindrop, make it fall, and check it against the catcher
    drops[i].displayImage();
    drops[i].fall();
    drops[i].check(catcher1);
  }

  catcher1.display();                           //method to display the cathcer
  if (millis() - oldTime> t) {                  //make timer to have one raindrop fall in a set amount of time
    index++;
    oldTime = millis();
  }
  fill(0, 200, 0);                              //set the fill for the score
  textSize(textsize);                           //set the text size for the score
  text(score, displayWidth*.25, displayHeight*.25);  //set the postion for the score
  if (score%10 == 0) {                         //each time the score increases by ten, increase the text size by ten
    textsize = 40 + score;
    
  }
}

