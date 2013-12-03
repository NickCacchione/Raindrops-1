int currentTime;
int oldTime = 0;
color c = color(255,0,100);

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  currentTime = millis();
  fill(c);
  ellipse(mouseX, mouseY, 50, 50);
  if (currentTime - oldTime > 2000) {
    c = color(random(255),random(255),random(255));
    oldTime = currentTime;
  }
}

