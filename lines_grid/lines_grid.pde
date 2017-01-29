void setup() {
  size(800, 800);
}

void draw() {
  background(147, 140, 135);
  stroke(241, 233, 230);

  int lines = 101;
  int border = 10;
  float maxSize = width - (2 * border);
  float step = maxSize / (lines - 1);

  for (int i = 0; i <= lines - 1; i++) {
    int z = (int)(i * step + border);
    stroke(241, 233, (z / maxSize) * 255);
    line(mouseX, z, z, mouseY);
  }
}