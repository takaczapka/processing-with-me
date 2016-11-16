void setup() {
  size(500, 500);
  
}

float idx = 0;
float increment = 0.02;

void draw() {
  frameRate(10);
  
  clear();
  noFill();
  stroke(255);
  strokeWeight(10);
  
  rectMode(CENTER);
  rect(width/2, height/2, 200, 200, 100 * lerp(0, 1, idx));

  int a = 30;
  line(width/2 - a, height/2 - a, width/2 + a, height/2 + a);
  line(width/2 - a, height/2 + a, width/2 + a, height/2 - a);
  
  idx += increment;
  idx = constrain(idx, 0, 1);
  if (idx == 1 || idx == 0) {
    increment = -increment;
  }
}