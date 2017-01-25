void setup() {
  fullScreen();
  reset();
}

void reset() {
  background(139);
  stroke(243);
}

void draw() {
  frameRate(20);
  line(0, height, mouseX, mouseY);
  line(width, height, mouseX, mouseY);
}

void mousePressed() {
  reset();
}

void keyTyped() {
  if (key == 's') {
    save("simple-lies-" + System.currentTimeMillis());
  }
}