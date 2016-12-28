import java.util.*;

int ballSize = 100;
List<Ball> balls = new LinkedList();
  
void setup() {
  size(800, 800);
  noStroke();
  
  int gridSize = (int(width / ballSize) - 1); 
  
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      balls.add(new Ball(i + 1, j + 1, ballSize));
    }
  }
}

int delay = 0;
int maxBallsInMotionPercentage = 50;
  
void draw() {
  frameRate(30);
  background(#6D3D86);
  
  if (currentlyInMotion() < maxBallsInMotion() && delay <= 0) {
    balls.get(int(random(balls.size()))).animate();
    delay = int(random(ballSize/4));
  } else {
    delay--;
  }
  
  for (Ball ball : balls) {
    ball.draw();
  }
}

int maxBallsInMotion() {
  return (balls.size() * maxBallsInMotionPercentage) / 100;
}

int currentlyInMotion() {
  int sum = 0;
  for (Ball ball : balls) {
    if (ball.inMotion()) sum++;
  }
  return sum;
}