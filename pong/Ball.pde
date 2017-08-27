class Ball {
  // this is center x, y of the ball
  float x, y;
  PVector direction;
  int size = 16;
  float speed = 3;
  float accelerationRate = 0.005;


  public Ball(float x, float y) {
    this.x = x;
    this.y = y;
    
    // making it start flying in a direction which is morelikely going towards players than top/bottom walls
    direction = new PVector(random(-5, 5), random(-2, 2)).normalize();
  }

  public void draw() {
    rect(x, y, size, size);
  }

  void tick() {
    // slowely making a ball moving faster
    speed += accelerationRate;

    // next position
    this.x = nextX();
    this.y = nextY();

    // does it hit top or bottom? if so, change direction.y
    if (this.y + (size/2) >= height || this.y - (size/2) <= 0) {
      direction.y *= -1;
    }
  }

  void bounceOffPlayer() {
    direction.x *= -1;
  }

  float nextX() {
    return this.x + (speed * direction.x);
  }
  
  float nextY() {
    return this.y + (speed * direction.y);
  }

  boolean isOffTheScreen() {
    return x < 0 || x > width;
  }

  Side whichSide() {
    if (x < width/2) 
      return Side.LEFT;
    else 
      return Side.RIGHT;
  }
}