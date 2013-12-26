int oldTime = 0;                               //value used to make timer
int index = 1;                                 //vairable used in the array
Raindrops [] drops = new Raindrops [100];      //set array
Catcher catcher1;                              //declare catcher
int score;                                     //variable to work more easily with the score
int textsize;                                  //variable used to help increase the text size every ten points scored
PImage background;                             //image for the background
int t =3000;                                   //variable determining the time for the timer
boolean start;                                 //helps to determine if start or end screen shows
int rectx;                                     //location of image on start screen
int recty;                                     //location of image on start screen
int rectd = 250;                               //size of image on start screen
PImage storm;                                  //picture for start screen
PImage arrow;                                  //picture for start screen
int lives = 10;                                //variable determining the number of lives
boolean gameover;                              //helps to determine if start or end screen shows
PImage skull;                                  //picture for end screen

void setup() {
  background = loadImage("background1.png");     //background image is set
  size(background.width, background.height);     //size of background
  for (int i = 0; i < drops.length; i++) {       //set an array for the raindrops
    drops[i] = new Raindrops();
  }
  catcher1 = new Catcher();                      //declaring catcher from catcher class
  textsize =40;                                  //set text size for score
  rectx = width/2;                               //value for variable
  recty = height/2;                              //value for variable
  storm = loadImage("stormbrewing.jpg");         //loading picture for start screen
  arrow = loadImage("arrow.png");                //loading picture for start screen
  skull = loadImage("transparentskull.png");     //loading picture for end screen
}

void draw() {
  background(234, 224, 111);                     //background color for start screen
  imageMode(CENTER);                             //centering image
  image(storm, rectx, recty, rectd, rectd);      //placing image on start screen
  image(arrow, width*.25, height/2, 250, 250);   //placing image on start screen
  textSize(100);                                 //size of text for start screen
  text("I feel a storm brewin'...", 0, height*.25); //message on start screen
  if (start == true && gameover == false) {       //if correct booleans are true/false game will begin
    background(background);     //setting the image "background" as the background
    textSize(40);               //size of text for score and lives counters
    fill(255, 0, 0);            //color of lives counter
    text(lives, displayWidth*.60, displayHeight*.25); //location of lives counter
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
  if (gameover == true) {                        //if this boolean is true, the end screen will show
    background(131, 34, 34);                     //background color for end screen
    image(skull,width/2,height/2);               //image for end screen
    fill(0);                                     //color for text
    text("sux2suk", width/2, height/2);          //message on end screen
    fill(255);                                   //color of restart button
    rect(0, height-100, width, 100);             //shape of restart button
    textSize(50);                                //size of text in restart button
    textAlign(CENTER);                           //centers text
    fill(0);                                     //color for text on restart button
    text("Do you want to try again?", width/2, height - 25); //text for restart message
  }
}



//start 
void mousePressed() {
  if (mouseX > rectx - rectd/2 && mouseX < rectx + rectd/2 && mouseY > recty - rectd/2 && mouseY < recty +rectd/2) {
    start = true;                                //if the picture on the start screen is clicked, the game begins
  }
  if (start == false && gameover ==true && mouseX > 0 && mouseX < 0 + width && mouseY > height-100 && mouseY < height  ) {
    start = true;                                //if the restart button is clicked, the game begins
    gameover = false;
    lives = 10;
    score = 0;
  }
}

