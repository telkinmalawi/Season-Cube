class Snow{
int Xpos;
int Ypos;
int Xradius;
int Speed;
Snow (int tempXpos,int tempYpos, int tempXradius, int tempSpeed){
Xpos = tempXpos;
Ypos = tempYpos;
Xradius = tempXradius;
Speed = tempSpeed;
}
void display(){
  fill(235);
  ellipse(Xpos,Ypos,Xradius,Xradius);
}
void move(){
  Ypos+= Speed;
}
void repeat(){
  if(Ypos>height){
    Ypos=0;
  }
}
}