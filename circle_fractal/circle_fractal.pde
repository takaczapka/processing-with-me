void setup() {
  size(1200, 700); 
}

int circles = 5;
float size_factor = 3;
int depth = 3;
boolean draw_inside = false;
color backgroundColor = color(255, 255, 255);
float opacity = 180;
float size = 200;
boolean useStroke = false;
boolean useFill = true;
float hue = 213;

void draw() {
  background(backgroundColor);
    
  if (useStroke) stroke(0);
  else noStroke();
  
  noFill();
  
  if (mouseX > 0) {
    opacity =  (255.0 / mouseX) * 100;
  }
  
  fractal(width / 2, height / 2, size, depth);
}

void fractal(float centerX, float centerY, float size, int depth) {
  
  if (depth <= 0) return;
  
  if (draw_inside) {
    fillTheColor(depth);
    ellipse(centerX, centerY, size, size);
    fractal(centerX, centerY, size / size_factor, depth - 1);
  }
  
  for (int i = 1; i <= circles; i++) {
    float newCenterX = centerX + cos((TWO_PI / circles) * i) * size;
    float newCenterY = centerY + sin((TWO_PI / circles) * i) * size; 
  
    fillTheColor(depth);
    ellipse(newCenterX, newCenterY, size, size);
        
    fractal(newCenterX, newCenterY, size / size_factor, depth - 1);
  } 
}

void fillTheColor(int depth) {
  if (useFill) {
    colorMode(HSB, 360, 100, 100);
    color fillColor = color(hue, 56, 81);
    
    if (depth == 1) fill(fillColor, opacity); 
    else noFill();
  }
}

void keyPressed() {
  if (key == 'q') {
    if (circles > 1) circles--;
  }
  if (key == 'w') {
    if (circles < 10) circles++;
  }
  if (key == 'a') {
    if (size_factor > 2) size_factor--;
  }
  if (key == 's') {
    if (size_factor < 5) size_factor++;
  }  
  if (key == 'z') {
    if (depth > 1) depth--;
  }
  if (key == 'x') {
    if (depth < 5) depth++;
  } 
  if (key == 'd') {
    draw_inside = !draw_inside;
  }
  if (key == 'e') {
    useStroke = !useStroke;    
  }
  if (key == 'r') {
    hue = random(360);    
  }
  if (key == 't') {
    useFill = !useFill;
  }
}