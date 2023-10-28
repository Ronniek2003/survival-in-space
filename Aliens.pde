class Aliens extends allEnemies {
  PImage [] aliens = new PImage[35];
  int imgCounter;
  PVector direction;


  Aliens(float apositionx, float apositiony, int size1, int size2, int health, float speed) {
    super(apositionx, apositiony, size1, size2, health, speed);
    for (int i = 0; i < aliens.length; i++) {

      aliens[i] = loadImage("alien-"+(i+1) +".png");
      aliens[i].resize(size1, size2);
    }
    direction = new PVector();
  }


  void render() {
    image( aliens[imgCounter/15 % 34], this.apositionx, this.apositiony);
    imgCounter++;
  }

  @Override
    void move() {
    direction.x = spaceship.x - this.apositionx+int(random(120, 130));
    direction.y = spaceship.y - this.apositiony;
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
}
