class newalien extends allEnemies {
  PImage [] newaliens = new PImage[5];
  int imgCounter;
  PVector direction;

  newalien(float apositionx, float apositiony, int size1, int size2, int health, float speed) {
    super(apositionx, apositiony, size1, size2, health, speed);
    for (int i = 0; i < newaliens.length; i++) {

      newaliens[i] = loadImage("newalien"+(i+1) +".png");
      newaliens[i].resize(size1, size2);
    }
    direction = new PVector();
  }



  void render() {
    image( newaliens[imgCounter/15 % 4], this.apositionx, this.apositiony);
    imgCounter++;
  }

  @Override
    void move() {
    direction.x = spaceship.x - this.apositionx+int(random(120, 130));
    direction.y = spaceship.y - this.apositiony;
    direction.normalize();

    apositionx += direction.x * speed;
    apositiony += direction.y * speed;
  }
}
