void setup() {
  size(500, 500);
  strokeWeight(4);
}

int x = 100;
int y = 100;

int step = 5;

void draw() {
  background(204);
  rect(x, y, 100, 100);
}

void keyPressed() {
  if (keyCode == UP) {
    y -= step;
  } else if (keyCode == DOWN) {
    y += step;
  } else if (keyCode == LEFT) {
    x -= step;
  } else if (keyCode == RIGHT) {
    x += step;
  }
}