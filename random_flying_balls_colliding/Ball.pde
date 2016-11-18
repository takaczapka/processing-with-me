
class Ball {
  float spring = 0.02;
  float speed;
  float x, y;
  float vx, vy;
  int rad = 50;
  Ball[] others;
  int id;
  int numBalls;

  Ball(float x, float y, float speed, int id, Ball[] otherBalls) {
    this.id = id;
    this.numBalls = otherBalls.length;
    this.others = otherBalls;

    this.speed = speed;

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

    vx = random(1);
    vy = random(1);
  }

  void move() {
    this.x = this.x + (speed * vx);
    this.y = this.y + (speed * vy);

    if (this.x + rad > width) {
      this.x = width - rad;
      vx *= -1;
    }
    if (this.x < rad) {
      this.x = rad;
      vx *= -1;
    }

    if (this.y + rad > height) {
      this.y = height - rad;
      vy *= -1;
    }  
    if (this.y < rad) {
      this.y = rad;
      vy *= -1;
    }
  }

  // TODO improve with different masses, etc. + use better algorithm https://gamedevelopment.tutsplus.com/tutorials/when-worlds-collide-simulating-circle-circle-collisions--gamedev-769
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      Ball other = others[i];
      float dx = other.x - x;
      float dy = other.y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = other.rad + rad;
      if (distance <= minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - other.x) * spring;
        float ay = (targetY - other.y) * spring;

        vx -= ax;  
        vy -= ay;
        other.vx += ax;
        other.vy += ay;
      }
    }
  }

  void draw() {
    ellipse(x, y, rad * 2, rad * 2);
  }
}