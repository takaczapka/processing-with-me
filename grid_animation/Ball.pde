
class Ball {
  int x;
  int y;
  int size;
  Animation animation = null;
  
  Colors colors = new Colors(new color[] { #EFEDF0, #D7D4D8, #AFAFAF});
  
  color fillColor = colors.next();
  
  Ball(int x, int y, int size) {
    this.x = x; this.y = y; this.size = size;
  }
  
  void draw() {
    if (inMotion()) {
      animation.draw();
    } else {
      fill(fillColor);
      ellipse(x * size, y * size, size - 2, size - 2);
    }
  }
  
  void animate() {
    if (!inMotion())
      animation = new Animation();
  }
 
  boolean inMotion() {
    if (animation != null && !animation.finished()) return true; else return false;
  }
 
  class Animation {
    private int currentPos = size - 2;
    private boolean goingDown = true; 
    private boolean done = false;
    
    void draw() {
      if (!done) {
        if (goingDown) {
          currentPos--;
        }
        else { 
          currentPos++;
        }
        fill(fillColor);
        ellipse(x * size, y * size, size - 2, currentPos);

        if (currentPos == 0) { goingDown = false; fillColor = colors.next(); }
        if (currentPos == size - 2) done = true;
      }
    }
    boolean finished() {
      return done;
    }
  }
}

class Colors {
    
  color[] colors;
  
  public Colors(color[] colors) {
    this.colors = colors;
  }
  int currentColor = 0;
  color next() {
     if (currentColor == colors.length) {
       currentColor = 0;
     };
     color c = colors[currentColor];
     currentColor++;
     return c;
  }
  
}