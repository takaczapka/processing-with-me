// TODO
// . pressing w or s for a long time makes it hang
//     * Check it with Processing 3.3.5
//     * arrows are ok, maybe use shift + ctrl?
// . speedup player movements if pressed longer
// . smooth out ball bouncing from top/bottom
// . smooth ball collisions from players
// . render player's score board


Player player1;
Player player2;
Ball ball;
Game game;

void setup() {
  size(800, 500);
  game = new Game();
}

void draw() {
  background(100);

  game.update();
  game.draw();
}  

void keyPressed() {
  if (keyCode == UP) {
    game.moveUpPlayer1();
  } else if (keyCode == DOWN) {
    println("DOWN: " + second());
    game.moveDownPlayer1();
  } else if (key == 'w') {
    println("W: " + second());
    game.moveUpPlayer2();
  } else if (key == 's') {
    game.moveDownPlayer2();
  } else if (key == 'r') {
    game.restart();
  }
  
}

enum Side { 
  LEFT, RIGHT
}

enum GameState { 
  RUNNING, STOPPED
}

class Player {
  Side side;

  int x;

  int b_length = 100;
  int b_width = 20;
  int y = (height/2) - (b_length / 2);

  int moveStep = 10;

  public Player(Side side) { 
    this.side = side;

    if (side == Side.LEFT) {
      x = 10;
    } else {
      x = width - 10 - b_width;
    }
  }

  public void draw() {
    rect(x, y, b_width, b_length);
  }

  public void moveUp() {
    if (y - moveStep >= 0) {
      y -= moveStep;
    }
  }

  public void moveDown() {
    if (y + b_length + moveStep <= height) {
      y += moveStep;
    }
  }

  boolean colliding(Ball ball) {
    if (side == Side.LEFT) {
      if (x + b_width >= ball.x && 
        y <= ball.y && y + b_length >= ball.y) {
        return true;
      } else {
        return false;
      }
    } else {
      if (x <= ball.x && 
        y <= ball.y && y + b_length >= ball.y) {
        return true;
      } else {
        return false;
      }
    }
  }
}

class Ball {
  float x, y;
  float dx, dy;
  float speed;
  int size = 10;

  public Ball(float x, float y, float speed) {
    this.x = x;
    this.y = y;

    //if (x + size >= width || x - size <= 0) {
    //  this.x = size + 1;
    //} else {
    //  this.x = x;
    //}

    //if (y + size >= height || y - size <= 0) {
    //  this.y = size + 1;
    //} else {
    //  this.y = y;
    //}

    this.speed = speed;

    dx = random(2) - 1;
    dy = random(1);
  }

  public void draw() {
    rect(x, y, size, size);
  }

  void move() {
    this.x = this.x + (speed * dx);
    this.y = this.y + (speed * dy);

    //if (this.x >= width || this.x <= 0) {
    //  dx *= -1;
    //}
    if (this.y >= height || this.y <= 0) {
      dy *= -1;
    }

    //if (this.x + size > width || this.x < size) {
    //  dx *= -1;
    //}
    //if (this.y + size > height || this.y < size) {
    //  dy *= -1;
    //}
  }

  void changeDirection() {
    dx *= -1;
  }
  
  boolean gone() {
    return (x < 0 || x > width);
  }
}

class Game {
  GameState state = GameState.STOPPED;
  Player player1 = new Player(Side.LEFT);
  Player player2 = new Player(Side.RIGHT);
  Ball ball;

  public Game() {
    restart();
  }

  void restart() {
    ball = new Ball(400, 250, 10);
  }

  void update() {
    ball.move();

    if (player1.colliding(ball) || player2.colliding(ball)) {
      ball.changeDirection();
    }
    
    if (ball.gone()) {
      restart();
    }
  }

  void draw() {   
    player1.draw();
    player2.draw();
    ball.draw();
  }

  void moveUpPlayer1() {
    player1.moveUp();
  }

  void moveDownPlayer1() {
    player1.moveDown();
  }   

  void moveUpPlayer2() {
    player2.moveUp();
  }   

  void moveDownPlayer2() {
    player2.moveDown();
  }
}