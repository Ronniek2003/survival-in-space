class Option {

  float positionx, positiony, widthscale, heightscale;
  String text;  // members


  Option(float nx, float ny, float nwidth, float nheight, String t) { // constructors
    positionx = nx;
    positiony = ny;
    widthscale = nwidth;
    heightscale = nheight;
    text = t;
  }

  void hoveroverbutton() { // method
    if ( mouseoverbutton() == true) {

      fill(100, 0, 0);
      rect(positionx, positiony, widthscale, heightscale);
      fill(0, 255, 0);
      textSize(25);
      textAlign(CENTER, CENTER);
      text(text, positionx+widthscale/2, positiony+heightscale/2);
    } else {
      fill(0, 0, 250);
      rect(positionx, positiony, widthscale, heightscale);
      fill(10, 210, 0);
      textSize(25);
      textAlign(CENTER, CENTER);
      text(text, positionx+widthscale/2, positiony+heightscale/2);
    }
  }
  boolean  mouseoverbutton() { // tells me if mouse is over the button

    if (mouseX >= positionx && mouseX <= positionx + widthscale && mouseY >= positiony && mouseY<= positiony + heightscale)
      return true;

    return false;
  }

  void loadbutton() {
    hoveroverbutton();
    mouseoverbutton();
  }
}
