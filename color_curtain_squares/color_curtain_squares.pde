void setup() {
//  size(500, 500);
  fullScreen();
  noStroke();
}

int hue = 137;

void draw() {
  frameRate(5);
  
  int _slices = mouseX / 2;
  int slices = 500;
  
  if (_slices > 0) {
    slices = _slices;
  }
  
  int rectWidth = (int(ceil((float) width / slices)));
  
  colorMode(HSB);
  
  for (int i = 0; i <= slices; i++) {
    for (int j = 0; j <= slices; j++) {
    
      int x = i * rectWidth;
      int y = j * rectWidth;
  
      int h = hue;
      int s = int(random(0, 255));
      int b = int(random(0, 255));
      int opacity = (int(((float) mouseY / height) * 255)); 

      fill(255);
      rect(x, y, rectWidth, height);

      fill(h, s, b, opacity);
      rect(x, y, rectWidth, rectWidth);
    }
  }
}

void mousePressed() {
  hue = int(random(0, 255));
}