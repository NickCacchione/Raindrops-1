color c = color(255,0,0);

void setup(){
 size(500,500); 
}

void draw(){
  background(0);
  fill(c);
  ellipse(width/2,height/2,50,50);
  if(frameCount%200 == 0){
   c=color(random(255),random(255),random(255)); 
  }
}
