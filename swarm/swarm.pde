import java.util.*;

LinkedList<Bee> bees = new LinkedList();

void setup() {
  size(800, 800);
  
  makeASwarm();
}

void draw() {
  background(#EAEAEA);
  noStroke();
  
  fill(#F2A43D);
  for (Bee bee: bees) {
    bee.draw();
  }
}

void mousePressed() {
  makeASwarm();
}

void mouseMoved() {
  for (Bee bee: bees) {
    bee.flyTo(mouseX, mouseY);
  }
}

void makeASwarm() {
  bees.clear();
  int count = int(random(400));
  for (int i = 0; i < count; i++) {
    bees.add(new Bee(random(width), random(height)));
  }
}

class Bee {
  float x, y;
  
  float dx = random(1);
  float dy = random(1);
  
  public Bee(float x, float y) {
    this.x = x; this.y = y;
    flyTo(x, y);
  }
  void draw() {
    x = x + dx;
    y = y + dy;
    
    ellipse(x, y, 10, 10);
  }
  
  void flyTo(float targetX, float targetY) {
    float _dx = targetX - x;
    float _dy = targetY - y;
    float distance = sqrt(_dx*_dx + _dy*_dy);

    if (distance != 0) {
      this.dx = _dx / distance;
      this.dy = _dy / distance;
    }
  }
}