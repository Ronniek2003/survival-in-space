class SPACESHIP {
  int imgCounter;
  PImage [] spaceship = new PImage[4];
  //PVector position;
  int x = 260;
  int y = 650;
  SPACESHIP() {
    for (int i = 0; i<spaceship.length; i++) {
      spaceship[i] = loadImage("R-"+(i+1) +".png");
      //spaceship[i].resize(300,150);
    }
  }
  void render() {

    if (imgCounter < 10) {
      image(spaceship[0], x, y);
    } else if (imgCounter < 20) {
      image(spaceship[1], x, y);
    } else if (imgCounter < 30) {
      image(spaceship[2], x, y);
    } else if (imgCounter < 40) {
      image(spaceship[3], x, y);
    } else {

      imgCounter = 0;
    }
    imgCounter++;
  }



  Boolean hascollided(allEnemies asteroids) {
    //return (abs(this.x - asteroids.apositionx) < 500) && (abs(this.y - asteroids.apositiony) < 0);
    float distanceX = abs(this.x - asteroids.apositionx);
    float distanceY = abs(this.y - asteroids.apositiony);
    return distanceX<290 && distanceY<10;
  }
}
