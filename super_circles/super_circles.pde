int centerXY;
int circleSize = 200;

void setup() {
  size(500, 500);
  noFill();

  // width is available once size(...) has been called - otherwise it's defaulted to 100
  centerXY = width / 2;
}

void draw() {
  frameRate(30); // frames per second - default is 60
  background(255);
  int step = abs(250 - mouseX);
  
  // beware of step = 0 - then display's for loop will be infinite
  if (step != 0) {
    display(step);
  }
}

void display(int step) {
  for (int i = 0; i < 360; i = i + step) {
    ellipse(
      centerXY + circleSize/2 * cos(radians(i)), 
      centerXY + circleSize/2 * sin(radians(i)), 
      circleSize, circleSize);
  }
}