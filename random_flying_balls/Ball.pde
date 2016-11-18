class Ball {

  float speed;
  float x, y;
  float directionX, directionY;
  int rad = 50;
  Ball[] otherBalls;

  Ball(float x, float y, float speed, Ball[] otherBalls) {
    
    if (x + rad >= width || x - rad <= 0) {
      this.x = rad + 1;
    } else {
      this.x = x;
    }
     
    if (y + rad >= height || y - rad <= 0) {
      this.y = rad + 1;
    } else {
      this.y = y;
    }
    
    this.speed = speed;
    this.otherBalls = otherBalls;
    
    directionX = random(1);
    directionY = random(1);
  }
  
  void move() {
    this.x = this.x + (speed * directionX);
    this.y = this.y + (speed * directionY);

    if (this.x + rad > width || this.x < rad) {
      directionX *= -1;
    }
    if (this.y + rad > height || this.y < rad) {
      directionY *= -1;
    }
    
  }
  
  void draw() {
    ellipse(x, y, rad * 2, rad * 2);
  }
}