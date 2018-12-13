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
  int spacing;
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
    rotateY(radians(40));
    shape(Seeds, Xpos, Ypos);
    popMatrix();
   
  }
  void grow() {
    Zpos+=1;
    println("Zpos" +Zpos);
    if(Zpos == 1300){
      Zpos = 0;
    }
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
