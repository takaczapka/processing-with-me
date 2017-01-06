int diam = 10;
float centX, centY;
float maxDiam;
void setup() {
  fullScreen();
  background(180);
  strokeWeight(1);
  noFill();
  centX = width/2;
  centY = height/2;
  maxDiam = height;
}

void draw() {
  if (diam <= maxDiam) {
    stroke(0, 0, 0, 255 * (diam / maxDiam));
    ellipse(centX, centY, diam, diam);
    diam += 10;
  }
}