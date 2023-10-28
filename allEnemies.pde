abstract class allEnemies {
  float apositionx;
  float apositiony;
  int size1;
  int size2;
  int health;
  PVector direction;
  float speed;
  allEnemies(float apositionx, float apositiony, int size1, int size2, int health, float speed) {
    this.apositionx = apositionx;
    this.apositiony = apositiony;
    this.size1 = size1;
    this.size2 = size2;
    this.health = health;
    this.speed = speed;

    //initializing the direction vector and speed
    direction = new PVector();
  }



  void update() {
    render();
    move();
  }

  abstract void render();

  void move() {
    direction.x = spaceship.x - apositionx+int(random(120, 125));
    direction.y = spaceship.y - apositiony;
    direction.normalize();

    apositionx += direction.x * speed;
    apositiony += direction.y * speed;
    //apositiony += random(2,7);
    ////if asteroid goes off screen, reset the y to width
    //if(apositiony>height+10){
    // apositiony = (int)random(-40,0);
    // apositionx = random(100,700);
    //}
  }


  boolean  mouseoverenemy() { // tells me if mouse is over the button

    if (mouseX >= apositionx && mouseX <= apositionx + size1 && mouseY >= apositiony && mouseY<= apositiony + size2)
      return true;

    return false;
  }

  boolean isDead() {
    return health<=0;
  }



  // Boolean hascollided(SPACESHIP asteroids) {

  //  print("x: "+this.apositiony);
  //  print(abs(asteroids.x-this.apositionx) + " , " + abs(asteroids.y-this.apositiony));

  //    return (abs(asteroids.x - this.apositionx) < 400) && (abs(asteroids.y - this.apositiony) < 200);
  //    }
}
