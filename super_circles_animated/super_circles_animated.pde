color c = color(0);
int x = 0;
float y = 100;
int speed = 1;

void setup() {
  size(500, 500);
  // noFill(); -- change me!
}

void draw() {
  background(255);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  fill(c); // -- change me!
  
  for (int i = 0; i < 360; i = i + x) {
    ellipse(250 + 100 * cos(radians(i)), 250 + 100 * sin(radians(i)), 200, 200);
  }
}