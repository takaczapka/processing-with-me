void setup() {
  size(800, 500);
  noLoop();
}

int balls = 15;

void draw() {
 
  background(255);
  
  int opacity = 150;
  fill(0, 0, 0, opacity);
  
  for (int i = 0; i < balls; i++) {
     ellipse(random(width), random(height), 100, 100); 
  }
}

void mousePressed() {
  balls = 15 + int(random(40));
  redraw();
}