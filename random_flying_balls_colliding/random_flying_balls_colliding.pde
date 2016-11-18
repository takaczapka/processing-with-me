int numberOfBalls = 10;
Ball[] balls = new Ball[numberOfBalls];

void setup() {
  size(800, 500);
 
  for (int i = 0; i < numberOfBalls; i++) {
    balls[i] = new Ball((int(random(width))), (int(random(height))), 1 + random(5), i, balls);
  }
}

void draw() {
  //frameRate(10);
  background(255);
  
  int opacity = 150;
  fill(173, 44, 180, opacity);
  
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.draw();       
  }
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}