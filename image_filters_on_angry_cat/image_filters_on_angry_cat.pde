PImage img;

void setup() {
  // load the image file
  img = loadImage("angry-cat.jpg");

  // a hack to get size set from vars
  size(10, 10);
  surface.setResizable(true);
  surface.setSize(img.width * 2, img.height * 2);
}

void draw() {
  // display the original image
  image(img, 0, 0);
  
  applyEffect(THRESHOLD, img.width, 0, 0, 1.0, img);
  applyEffect(POSTERIZE, 0, img.height, 2, 10, img);
  applyEffect(BLUR, img.width, img.height, 1, 15, img);
}

void applyEffect(int effect, int x, int y, 
  float minTargetRange, float maxTargetRange, PImage originalImg) {
  PImage img = originalImg.get(); // make a copy

  // calculate threshold based on the y-position of mouse
  float t = map(mouseY, 
    0, height, // range of values for mouseY
    minTargetRange, maxTargetRange       // target range to convert to
    );

  // apply the filter
  img.filter(effect, t);

  // display the image
  image(img, x, y);
}