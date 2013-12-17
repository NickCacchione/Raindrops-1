int oldTime = 0;                               //value used to make timer
int index = 1;                                 //vairable used in the array
Raindrops [] drops = new Raindrops [100];      //set array
Catcher catcher1;                              //declare catcher
int score;                                     //variable to work more easily with the score
int textsize;
PImage background;
int t =3000;
boolean start;
int rectx;
int recty;
int rectd = 250;
PImage storm;
PImage arrow;
int lives = 1;
boolean gameover;
PImage skull;

void setup() {
  background = loadImage("background1.png");     //background image is set
  size(background.width, background.height);     //size of background
  for (int i = 0; i < drops.length; i++) {       //set an array for the raindrops
    drops[i] = new Raindrops();
  }
  catcher1 = new Catcher();                      //declaring catcher from catcher class
  textsize =40;                                  //set text size for score
  rectx = width/2;
  recty = height/2;
  storm = loadImage("stormbrewing.jpg");
  arrow = loadImage("arrow.png");
  skull = loadImage("transparentskull.png");
}

void draw() {
  background(234, 224, 111);
  imageMode(CENTER);
  image(storm, rectx, recty, rectd, rectd);
  image(arrow, width*.25, height/2, 250, 250); 
  textSize(100);
  text("I feel a storm brewin'...", 0, height*.25);
  if (start == true && gameover == false) {
    background(background);     //setting the image "background" as the background
    textSize(40);
    fill(255, 0, 0);
    text(lives, displayWidth*.60, displayHeight*.25);
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
  if (gameover == true) {
    background(131, 34, 34);
    image(skull,width/2,height/2);
    fill(0);
    text("sux2suk", width/2, height/2);
    fill(255);
    rect(0, height-100, width, 100);
    textSize(50);
    textAlign(CENTER);
    fill(0);
    text("Do you want to try again?", width/2, height - 25);
  }
}



//start 
void mousePressed() {
  if (mouseX > rectx - rectd/2 && mouseX < rectx + rectd/2 && mouseY > recty - rectd/2 && mouseY < recty +rectd/2) {
    start = true;
  }
  if (start == false && gameover ==true && mouseX > 0 && mouseX < 0 + width && mouseY > height-100 && mouseY < height  ) {
    start = true;
    gameover = false;
    lives = 10;
    score = 0;
  }
}

