


class Asteroids extends allEnemies {

  PImage [] asteroid = new PImage[20];
  int imgCounter;
  PVector direction;



  Asteroids(float apositionx, float apositiony, int size1, int size2, int health, float speed) {
    super(apositionx, apositiony, size1, size2, health, speed);
    for (int i = 0; i<asteroid.length; i++) {

      asteroid[i] = loadImage("asteroid"+(i+1) +".png");
      asteroid[i].resize(size1, size2);
    }
    direction = new PVector();
  }

  void render() {
    image(asteroid[imgCounter/15 % 19], this.apositionx, this.apositiony);
    imgCounter++;
  }

  @Override
    void move() {
    direction.x = spaceship.x - apositionx+int(random(120, 130));
    direction.y = spaceship.y - apositiony;
    direction.normalize();

    apositionx += direction.x * speed;
    apositiony += direction.y * speed;
    //apositiony += random(2,7);
    ////if asteroid goes off screen, reset the y to width
    //if(apositiony>height+10){
    // apositiony = -10;
    // apositionx = random(100,700);
    //}
  }

  void update() {
    render();
    move();
  }
}
