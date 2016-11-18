int numberOfBalls = 15;
Ball[] balls = new Ball[numberOfBalls];

void setup() {
  size(800, 500);
 
  for (int i = 0; i < numberOfBalls; i++) {
    balls[i] = new Ball((int(random(width))), (int(random(height))), 1 + random(5));
  }
}

void draw() {
  //frameRate(10);
  background(255);
  
  int opacity = 150;
  fill(0, 0, 0, opacity);
  
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].draw();       
  }
}