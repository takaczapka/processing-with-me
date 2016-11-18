class Ball {

  float speed;
  float x, y;
  float directionX, directionY;
  int rad = 50;
  ColorCircle[] circles;

  Ball(float x, float y, float speed) {
    
    circles = new ColorCircle[] {
      new ColorCircle(-15 + random(20), -15 + random(30), 250, 10, 194),
      new ColorCircle(-15 + random(20), -15 + random(30), 60, 224, 86),
      new ColorCircle(-15 + random(20), -15 + random(30), 10, 196, 250),
      new ColorCircle(0, 0, 0, 0, 0)
    };
    
    
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
    int opacity = 180;
    
    for (ColorCircle c : circles) {
      fill(c.r, c.g, c.b, opacity);      
      ellipse(x + c.x, y + c.y, rad * 2, rad * 2); 
    }
  }
}

class ColorCircle {
  float x, y;
  int r,g,b;
  
  ColorCircle(float x, float y, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
  }
}