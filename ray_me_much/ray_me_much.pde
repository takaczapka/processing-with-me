void setup() {
  // size(800, 500);
  fullScreen();
  background(255);
  
  noStroke();
}

void draw() {
  frameRate(1);
   background(255);

   fill(245, 181, 17);

   ellipse(width/2, height/2, 100, 100);
   
   float minRayLen = 50 + mouseX;
   float yRatio = mouseY / (float) height;
   float maxStep = PI / 8;
   if (yRatio != 0) maxStep = PI / (64 * yRatio);
   if (maxStep == 0) maxStep = PI/8;
   
   rays(width / 2, height / 2, minRayLen, maxStep);
}

void rays(float x, float y, float minRayLen, float maxStep) {

  float minStep = maxStep / 2;
  float revolution = 0;
  
  while (revolution < TWO_PI) {
    float step = revolution + minStep + random(maxStep);
    if (step + minStep >= TWO_PI) break;
 
    beginShape();

    float arcStep = 0.001;
    for (float a = revolution; a <= step; a += arcStep) {
      vertex(cos(a) * 80 + x, sin(a) * 80 + y);
    }

    float rayLen = minRayLen + random(minRayLen / 5); // +/- 20%

    vertex(cos(step) * rayLen + x, sin(step) * rayLen + y);

    for (float a = step; a >= revolution; a -= arcStep) {
      vertex(cos(a) * rayLen + x, sin(a) * rayLen + y);
    }

    endShape(CLOSE);
    
    revolution = step + minStep + random(minStep);
  }
}