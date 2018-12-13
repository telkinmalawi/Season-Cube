class Rain{
int Xpos;
int Ypos;
int tempXpos;
int tempYpos;
Rain (int tempXpos,int tempYpos){
Xpos = tempXpos;
Ypos = tempYpos;
}
void display(){
  strokeWeight(7);
  stroke(255,255,255,60);
  line(Xpos,Ypos,Xpos+50,Ypos+50);
}
void move(){
  line(Xpos,Ypos,Xpos+50,Ypos+50);
  Xpos+= 10;
  Ypos+= 10;
}
void repeat(){
  if(Xpos>width+50 && Ypos> height+50){
    for (int k = 0; k < 34; k ++ ) {
    seperation = 0;
    for (int j = 0; j < 10; j ++ ) {
    rainList[j*34+k] = new Rain(j*seperation,k*spacing);
    seperation = 144;
    }
    spacing = 75;
    }
  Xpos = tempXpos;
  Ypos = tempYpos;
  
  }
}
}
