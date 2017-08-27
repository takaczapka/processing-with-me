enum MovementDirection { 
  UP, DOWN
}

class Player {
  Side side;
  int score = 0;
  
  int moveStep = 2;
  
  int sizeY = 140;
  int sizeX = 20;
  
  int x;
  int y = height/2;

  boolean isMoving = false;
  MovementDirection direction = MovementDirection.UP;
  int dy = 0;

  public Player(Side side) { 
    this.side = side;

    int offTheScreen = 10;
    if (side == Side.LEFT) {
      x = offTheScreen + (sizeX / 2);
    } else {
      x = width - offTheScreen - (sizeX / 2);
    }
  }

  public void addScore() {
    score++;
  }

  public void draw() {
    rect(x, y, sizeX, sizeY);
  }

  public void tick() {
    
    if (isMoving) {
      // if hitting top or bottom -> stop
      if (y - (sizeY/2) + dy < 0 || y + (sizeY/2) + dy > height) {
        stop();
      } else {
        // otherwise keep moving (and increasing movement's acceleration)
        if (direction == MovementDirection.UP) {      
          dy--;
        } else {
          dy++;
        }

        y += dy;
      }
    }
  }

  // moveUp/Down and stop are called from the Game explicitly.
  // Longer player move is on, more acceleration it gets, see tick() method. 
  public void moveUp() {
    isMoving = true;
    direction = MovementDirection.UP;
    if (dy >= 0) dy = -moveStep;
  }

  public void moveDown() {
    isMoving = true;
    direction = MovementDirection.DOWN;
    if (dy <= 0) dy = moveStep;
  }

  public void stop() {
    isMoving = false;
    dy = 0;
  }

  // that's a bit hairy logic because it has two cases, left and right and it decides on which edges are tested
  boolean willHit(Ball ball) {
    if (side == Side.LEFT) {

      float nextBallX = ball.nextX() - ball.size/2;
      float nextBallY = ball.nextY();
      
      float leftXEdge = x + (sizeX/2); 

      if (leftXEdge < ball.x && leftXEdge >= nextBallX && y - (sizeY/2) <= nextBallY && y + (sizeY/2) >= nextBallY) {
        return true;
      } else {
        return false;
      }
    } else {
      float nextBallX = ball.nextX() + ball.size/2;
      float nextBallY = ball.nextY();
      
      float rightXEdge = x - (sizeX/2); 

      if (rightXEdge > ball.x && rightXEdge <= nextBallX && y - (sizeY/2) <= nextBallY && y + (sizeY/2) >= nextBallY) {
        return true;
      } else {
        return false;
      }
    }
  }
}