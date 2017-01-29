
void setup() {
  size(800, 600);
}

color  startColorLeft = color(204, 102, 0);
color startColorRight = color(0, 102, 153);
color  targetColorLeft = color(0);
color targetColorRight = color(255);

int pos = 0;
color currentLeft = startColorLeft;
color currentRight = startColorRight;

void draw() {
  pos += 1;
  float step = 40.0; 
  currentLeft = lerpColor(startColorLeft, targetColorLeft, pos / step);
  currentRight = lerpColor(startColorRight, targetColorRight, pos / step);

  for (int i = 0; i <= width + height; i++) {
    float inter = map(i, 0, width + height, 0, 1);
    color c = lerpColor(currentLeft, currentRight, inter);
    stroke(c);
    line(0, i, i, 0);
  }
}