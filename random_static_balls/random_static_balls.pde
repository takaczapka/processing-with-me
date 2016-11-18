void setup() {
//  size(800, 500);
  fullScreen();
  noLoop();
}

int balls = 15;

void draw() {
 
  background(255);
  
  int opacity = 180;
  
  for (int i = 0; i < balls; i++) {
     float x = random(width);
     float y = random(height);
   
     fill(250, 10, 194, opacity);
     ellipse(x + (-15 + random(20)), y + (-15 + random(30)), 100, 100); 
   
     fill(60, 224, 86, opacity);
     ellipse(x + (-15 + random(20)), y + (-15 + random(30)), 100, 100); 

     fill(10, 196, 250, opacity);
     ellipse(x + (-15 + random(20)), y + (-15 + random(30)), 100, 100);
     
     fill(0, 0, 0, opacity);
     ellipse(x, y, 100, 100); 
  }
}

void mousePressed() {
  balls = 15 + int(random(40));
  redraw();
}