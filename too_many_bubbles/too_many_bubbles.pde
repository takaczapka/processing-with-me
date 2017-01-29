void setup() {
  size(800, 600);
  noStroke();

  noLoop();
  
  // initial fill
  for (int i = 0; i < 3; i++) {
    draw();
  }
}

void draw() {

  int amount = 2000;

  for (int i = 0; i < amount; i++) {
    int x = (int)random(width);
    int y = (int)random(height);

    fill((((float)y) / height) * 220 + 36);
   
    ellipse(x, y, 50, 50);
  }
}

void mousePressed() {
  redraw();
}