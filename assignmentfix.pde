//references //<>// //<>//
//https://gfycat.com/stickers/search/asteroid+senshi
//https://www.artstation.com/artwork/ARKZX
//https://opengameart.org/content/space-music
//https://www.deviantart.com/psycopink/art/Alien-sprite-3-356713545




// Download sound tool
import processing.sound.*;
SPACESHIP spaceship;
Option button1, button2, button3, button4, button5, button6, easy, medium, hard;
Explosion explosion;
SoundFile spacesong;
float bgY = 0;
float bgX = 0;
String Gamemode;
PImage space, Gamename;
ArrayList<allEnemies>enemies = new ArrayList<>();

int starttimer;
int points = 0;
int easyhighscore = 0;
int mediumhighscore = 0;
int hardhighscore = 0;

void setup() {
  Gamemode = "LOADING";
  spacesong = new SoundFile(this, "spaceship.wav");
  newbuttons();
  size(800, 800);
  space = loadImage("space_background_asteroid.png");
  Gamename = loadImage("gamename.png");
  Gamename.resize(800, 100);
  space.resize(width, height+200);
  frameRate(30);
  starttimer = millis();
  spacesong.play();
  spacesong.loop();
  spacesong.amp(1);
  String[] newscores = loadStrings("data/highscoreeasy.txt");
  if (newscores.length > 0) {
    easyhighscore = int(newscores[0]);
  }



  String[] newscores1 = loadStrings("data/highscoremedium.txt");
  if (newscores1.length > 0) {
    mediumhighscore = int(newscores1[0]);
  }


  String[] newscores2 = loadStrings("data/highscorehard.txt");
  if (newscores2.length > 0) {
    hardhighscore = int(newscores2[0]);
  }
}

void gamename() {
  image(Gamename, 0, 100);
}

void RespawnEnemies() {
  int spawn = 20;
  enemies = new ArrayList<>();
  for (int i = 0; i<spawn; i++) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 30*int(random(1, 3));
    int imgsize2 = 50*int(random(1, 3));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 4);
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
}



void draw() {
  gamemodes();
}


void newbuttons() {
  button1 = new Option(width/2, height-500, 300, 150, "Play");
  button3 = new Option(50, 250, 150, 80, "Help");
  button4 = new Option(50, 350, 150, 80, "Credits");
  button5 = new Option(50, 450, 150, 80, "Exit");
  button6 = new Option(125, 550, 150, 80, "Back");
  spaceship = new SPACESHIP();
  explosion = new Explosion();
  easy = new Option(200, 100, 200, 100, "EASY");
  medium = new Option(200, 300, 200, 100, "MEDIUM");
  hard = new Option(200, 500, 200, 100, "HARD");
}

void movingspace() {
  image(space, bgX, 0); //draw background twice
  image(space, bgX+space.width, 0);
  bgX -=4; //move background 4 pixels to left
  if (bgX == -space.width) {
    bgX=0; //wrap background
  }
}

void CheckNewHighscoreeasy() {

  if (points > easyhighscore) {
    easyhighscore = points;
    saveStrings("data/highscoreeasy.txt", new String[] { str(easyhighscore) });
  }
  text("highscore: "+easyhighscore, 500, 100);
}

void CheckNewHighscoremedium() {

  if (points > mediumhighscore) {
    mediumhighscore = points;
    saveStrings("data/highscoremedium.txt", new String[] { str(mediumhighscore) });
  }
  text("highscore: "+mediumhighscore, 500, 100);
}


void CheckNewHighscorehard() {

  if (points > hardhighscore) {
    hardhighscore = points;
    saveStrings("data/highscorehard.txt", new String[] { str(hardhighscore) });
  }
  text("highscore: "+hardhighscore, 500, 100);
}

void easygamemode() {
  int elapsedTime = (millis() - starttimer) / 1000;
  CheckNewHighscoreeasy();
  // display the elapsed time on the screen
  fill(255, 0, 0);
  textSize(32);
  text("Time: "+elapsedTime, width-100, 100);
  fill(0, 0, 255);
  textSize(32);
  text("Points:"+points, 100, 100);

  if (elapsedTime >30 && elapsedTime<33) {
    int texty = 400;
    textSize(20);
    textAlign(CENTER);
    text("you have been surviving for too long try and keep up", 300, texty);
  }
  if (elapsedTime >35 && elapsedTime % 3 == 0) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 30*int(random(1, 3));
    int imgsize2 = 50*int(random(1, 3));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 3);
    if (imgsize1>50||imgsize2>50) {
      newhealth*=int(random(1, 4));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
  if (elapsedTime % 10 == 0) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 30*int(random(1, 3));
    int imgsize2 = 50*int(random(1, 3));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 3);
    if (imgsize1>50||imgsize2>50) {
      newhealth*=int(random(1, 4));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
}

void mediumgamemode() {
  int elapsedTime = (millis() - starttimer) / 1000;
  CheckNewHighscoremedium();
  // display the elapsed time on the screen
  fill(255, 0, 0);
  textSize(32);
  text(elapsedTime, width-100, 100);
  fill(0, 0, 255);
  textSize(32);
  text(points, 100, 100);

  if (elapsedTime >40 && elapsedTime<43) {
    int texty = 400;
    textSize(20);
    textAlign(CENTER);
    text("you have been surviving for too long try and keep up", 300, texty);
  }
  if (elapsedTime >45 && elapsedTime % 3 == 0) {

    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 30*int(random(1, 4));
    int imgsize2 = 50*int(random(1, 5));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 3);
    if (imgsize1>60||imgsize2>90) {
      newhealth*=int(random(1, 4));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
  if (elapsedTime % 5 == 0) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 40*int(random(1, 5));
    int imgsize2 = 50*int(random(1, 5));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 4);
    if (imgsize1>60||imgsize2>90) {
      newhealth*=int(random(1, 5));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien (x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
}

void hardgamemode() {
  int elapsedTime = (millis() - starttimer) / 1000;
  CheckNewHighscorehard();
  // display the elapsed time on the screen
  fill(255, 0, 0);
  textSize(32);
  text(elapsedTime, width-100, 100);
  fill(0, 0, 255);
  textSize(32);
  text(points, 100, 100);
  if (elapsedTime >60 && elapsedTime<63) {
    int texty = 400;
    textSize(20);
    textAlign(CENTER);
    text("you have been surviving for too long try and keep up", 300, texty);
  }
  if (elapsedTime >45 && elapsedTime % 3 == 0) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 50*int(random(1, 7));
    int imgsize2 = 50*int(random(1, 7));
    int newhealth = 1;
    float speed = random(1, 6);
    int randomnumbers = (int) random(1, 4);
    if (imgsize1>70||imgsize2>90) {
      newhealth*=int(random(1, 7));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
  if (elapsedTime % 2 == 0) {
    int x = (int)random(0, 700);
    int y = (int)random(-40, 0);
    int imgsize1 = 30*int(random(1, 3));
    int imgsize2 = 50*int(random(1, 3));
    int newhealth = 1;
    float speed = random(1, 5);
    int randomnumbers = (int) random(1, 4);
    if (imgsize1>50||imgsize2>50) {
      newhealth*=int(random(1, 6));
    }
    switch(randomnumbers) {
    case 1:
      enemies.add(new Asteroids(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 2:
      enemies.add( new Aliens(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    case 3:
      enemies.add( new newalien(x, y, imgsize1, imgsize2, newhealth, speed));
      break;
    }
  }
}








void mainmenu() {

  button1.loadbutton();
  if (button1.mouseoverbutton()&& mousePressed) {
    Gamemode ="PLAY";
  }

  button3.loadbutton();
  if (button3.mouseoverbutton()&& mousePressed) {
    Gamemode = "Help";
  }
  button4.loadbutton();
  if (button4.mouseoverbutton()&& mousePressed) {
    Gamemode = "CREDITS";
  }
  button5.loadbutton();
  if (button5.mouseoverbutton()&& mousePressed) {
    exit();
  }
}

void leveldifficulty() {
  easy.loadbutton();
  if (easy.mouseoverbutton()&& mousePressed) {
    Gamemode = "easy";
    easygamemode();
    starttimer = millis();
    points = 0;
    RespawnEnemies();
  }
  medium.loadbutton();
  if (medium.mouseoverbutton()&& mousePressed) {
    Gamemode = "medium";
    mediumgamemode();
    starttimer = millis();
    points = 0;
    RespawnEnemies();
  }
  hard.loadbutton();
  if (hard.mouseoverbutton()&& mousePressed) {
    Gamemode = "hard";
    hardgamemode();
    starttimer = millis();
    points = 0;
    RespawnEnemies();
  }
}


void credit() {
  if (Gamemode == "CREDITS") {

    backtohomescreen();
    credits();
  }
}

void backtohomescreen() {
  button6.loadbutton();
  if (button6.mouseoverbutton()&& mousePressed) {
    Gamemode = "LOADING";
  }
}


void gamemodes() {
  if (Gamemode == "LOADING") {
    movingspace();
    mainmenu();
    gamename();
  }
  if (Gamemode == "PLAY") {
    movingspace();
    leveldifficulty();
  }
  if (Gamemode == "easy") {
    movingspace();
    easygamemode();
    spaceship.render();
    for (allEnemies e : enemies) {
      e.update();

      if (spaceship.hascollided(e)) {

        Gamemode = "FINISHED";
        println("gamemodes finished");
      }
    }
  }
  if (Gamemode == "medium") {
    movingspace();
    mediumgamemode();
    spaceship.render();
    for (allEnemies e : enemies) {
      e.update();

      if (spaceship.hascollided(e)) {

        Gamemode = "FINISHED";
        println("gamemodes finished");
      }
    }
  }
  if (Gamemode == "hard") {
    movingspace();
    hardgamemode();
    spaceship.render();
    for (allEnemies e : enemies) {
      e.update();

      if (spaceship.hascollided(e)) {

        Gamemode = "FINISHED";
        println("gamemodes finished");
      }
    }
  }

  if (Gamemode == "Help") {
    movingspace();
    help();
    backtohomescreen();
  }
  if (Gamemode == "CREDITS") {
    movingspace();
    backtohomescreen();
    credits();
  }
  if (Gamemode == "FINISHED") {
    background(255, 0, 0);
    fill(0, 255, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("HOW ARE YOU THIS BAD?\n TRY AGAIN!", height/2, width/2);
    backtohomescreen();
    enemies.clear();
    starttimer=0;
  }
  if (Gamemode == "GAMEWIN") {
    background(0, 0, 255);
    fill(0, 255, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Congrats you not as bad as I thought!", height/2, width/2);
    backtohomescreen();
    enemies.clear();
  }
}





void mousePressed() {
  ArrayList<Object> enemiestoremove = new ArrayList<Object>();
  //if(enemies.size() <=0){
  //    Gamemode = "GAMEWIN";
  //  }

  // loop through the list to check if the mouse was clicked on any of them
  for (allEnemies enemy : enemies) {
    // calculate distance between the mouse and the enemy
    if (enemy.mouseoverenemy()) {
      enemy.health = enemy.health - 1;
      points+=5;
      println(points+(" points"));
      explosions();
      if (enemy.health>2) {
        points+=10;
        println(points+(" points"));
      }
    }
  }

  for (Object enemiesremoved : enemies) {
    if (enemiesremoved instanceof allEnemies && ((allEnemies) enemiesremoved).isDead()) {
      enemiestoremove.add(enemiesremoved);
    }
  }

  for (Object enemiesremoved : enemiestoremove) {
    enemies.remove(enemiesremoved);
  }
}


void explosions() {
  explosion.render();
}

void credits() {
  fill(255);
  textSize(15);
  textAlign(LEFT);
  text("Game created by: Ronnie Kumah", 0, 100);
  text("asteroid image is from https://gfycat.com/stickers/search/asteroid+senshi", 0, 130);
  text("alien image is from //https://www.artstation.com/artwork/ARKZX", 0, 160);
  text("spaceship image is from https://gradius.fandom.com/wiki/Vic_Viper", 0, 200);
  text("menu music is from //https://opengameart.org/content/menu-music", 0, 250);
  text("used this to create the title https://inkpx.com/", 0, 300);
  text("2nd alien image is from https://www.deviantart.com/psycopink/art/Alien-sprite-3-356713545", 0, 350);
  text("space background image is from https://www.deviantart.com/toxicgraffiti/art/Galaxy-Backround-Made-by-me-684370103", 0, 400);
  text("music from https://opengameart.org/content/space-music", 0, 450);
}

void help() {
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("you are playing survival in space the main aim of this game is to protect the", 0, 130);
  text("spaceship from aliens and asteroids by clicking on the enemies.", 0, 160);
  text("remember the bigger the enemy the more lives they have", 0, 190);
  text("which means that you will need to click on the enemy", 0, 220);
  text("more than once depending on how strong the enemy is.", 0, 250);
  text("the number in blue is the amount of points u have.", 0, 280);
  text("the number in red is the timer.", 0, 320);
}
