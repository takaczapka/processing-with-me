void setup() {
  size(800, 600);
  background(255);
  //noLoop();
  smooth();
  noFill();
  stroke(0);
}

void draw2() {

  beginShape();
  curveVertex(40, 40); // the first control point
  curveVertex(40, 40); // is also the start point of curve
  curveVertex(80, 60);
  curveVertex(100, 100);
  curveVertex(60, 120);
  curveVertex(50, 150); // the last point of curve
  curveVertex(50, 150); // is also the last control point
  endShape();
}

float X = 40;
float Y = 40;
float rads = 0;

void draw() {
  frameRate(20);

  beginShape();
  curveVertex(X, Y);
  curveVertex(X, Y);

  next();

  curveVertex(X, Y);
 
  nextRads();
  next();

  curveVertex(X, Y);
  curveVertex(X, Y);


  endShape();
}


void next() {
  float step = 20 + random(30); // max 50px

  X = cos(rads) * step + X;
  
  if (X < 0) X = 5;
  if (X > width) X = width - 5;

  Y = sin(rads) * step + Y;
  
  if (Y < 0) Y = 5;
  if (Y > height) Y = height - 5;
}

void nextRads() {
  float coef = (random(1) < 0.5) ? -1 : 1;
  rads = rads + coef * random(HALF_PI);
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}