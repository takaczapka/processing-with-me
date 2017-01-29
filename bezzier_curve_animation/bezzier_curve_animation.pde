float steps = 100;
float pos = 0;
int x1 = 10;
int y1 = 10;
int x2 = width - 10;
int y2 = height - 10;

void setup() {
  size(800, 800);
  frameRate(30);
  noFill();
  strokeWeight(20);

  x1 = 20;
  y1 = 20;
  x2 = width - 20;
  y2 = height - 20;

  smooth();
}

void draw() {
  // smudging background
  fill(205, 80);
  noStroke();
  rect(0, 0, width, height);

  // the curve
  noFill();
  stroke(115, 160, 226);

  pos += (TWO_PI / steps);

  float c = width / 2;
  float s = 200; 
  if (mouseX != 0) s = mouseX;
  bezier(x1, y1, 
    cos(pos) * s + c, sin(pos) * s + c, sin(pos) * s + c, cos(pos) * s + c, 
    x2, y2);
}

boolean settingX1Y1 = true;
void mousePressed() {
  if (settingX1Y1) {
    x1 = mouseX;
    y1 = mouseY;
  } else {
    x2 = mouseX;
    y2 = mouseY;
  }
  settingX1Y1 = !settingX1Y1;
}