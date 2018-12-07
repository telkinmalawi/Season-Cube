class Seed {
  PShape Seeds;
  int Xpos;
  int Ypos;
  int Zpos;
  int Scale;
  int tempYpos;
  int tempXpos;
  int tempZpos;
  int tempScale;
  Seed(int tempXpos, int tempYpos, int Zpos, int tempScale) {
    Xpos = tempXpos;
    Ypos = tempYpos;
    Zpos = tempZpos;
    Scale = tempScale;
    Seeds = loadShape("Seeds.obj");
    Seeds.setFill(color(255));
    Seeds.scale(Scale);
  }
  void display() {
    pushMatrix();
    translate(0, 0, Zpos);
    rotateY(radians(90));
    shape(Seeds, Xpos, Ypos);
    popMatrix();
  }
  void grow() {
    Zpos+=10;
    println("Zpos" +Zpos);
  }
  void move() {
    //Xpos += 10;
    //Ypos += 10;
  }
  void repeat() {
    if (Zpos>= 2000) {
      Zpos = tempZpos;
    }
  }
}