class Explosion {
  PImage [] explosion = new PImage[19];
  int imgCounter;

  Explosion() {
    for (int i = 0; i<explosion.length; i++) {

      explosion[i] = loadImage("explosion"+(i+1) +".png");
    }
  }

  void render() {
    image(explosion[imgCounter % 19], mouseX-30, mouseY-50);
    imgCounter++;
  }
}
