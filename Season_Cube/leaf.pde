class Leaf{
  PShape leaf;
float Xpos;
float Ypos;
int Zpos; 
int Yspeed; 
int Xrotation;
Leaf( float tempXpos, float tempYpos, int tempZpos, int tempYspeed, int tempXrotation){
Xpos = tempXpos;
Ypos = tempYpos;
Zpos = tempZpos;
Yspeed = tempYspeed;
Xrotation = tempXrotation;
leaf = loadShape("SM_Leaf_21.obj");
  leaf.scale(500);
  leaf.setFill(color(random(255),random(255),0));

}
void display(){
shape(leaf,Xpos,Ypos);
rotateX(radians(Xrotation));
}
void move(){
Ypos = Ypos + Yspeed;
}
void repeat(){
  if(Ypos>=height){
    Ypos = 0;
  }
}
}