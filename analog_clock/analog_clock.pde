void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(172);

  //scale(0.9, 0.9);
  translate(width/2, height/2);

  // zipherblat
  pushMatrix();
  scale(0.9, 0.9);
  fill(255);
  for (int i = 0; i <= 59; i++) {
    float a = map(i, 0, 60, 0.0, TWO_PI);

    if (i % 15 == 0) {
      ellipse(cos(a) * height / 2, sin(a) * height/2, 15, 15);
    } else {
      ellipse(cos(a) * height / 2, sin(a) * height/2, 10, 10);
    }
  }

  popMatrix();

  // get the current time
  int s = second();
  int m = minute();
  int h = hour();

  // draw the seconds hand
  pushMatrix();
  rotate(radians(map(s, 0, 60, 0, 360)));
  stroke(70, 70, 70);
  strokeWeight(1);
  line(0, 0, 0, -210);
  popMatrix();

  // draw the minutes hand
  pushMatrix();
  rotate(radians(map(m, 0.0, 60.0, 0.0, 360.0)));
  stroke(60, 60, 61);
  strokeWeight(5);
  line(0, 0, 0, -200);
  popMatrix();

  // draw the hours hand
  pushMatrix();
  if (h > 12) h -= 12;
  rotate(radians(map(h + m / 60.0, 0.0, 12, 0.0, 360.0)));
  strokeWeight(5);
  stroke(0, 0, 0);
  line(0, 0, 0, -100);
  popMatrix();

  // "button" at the center
  fill(0);
  noStroke();
  ellipse(0, 0, 15, 15);
}