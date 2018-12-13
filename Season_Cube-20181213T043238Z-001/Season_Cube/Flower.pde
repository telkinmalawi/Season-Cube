class Flower{
int Xpos;
int Ypos;
float r;
float j;
PImage flowerImage;
Flower(String flowerFileName, int tempXpos,int tempYpos){
 Xpos = tempXpos;
 Ypos = tempYpos;
 flowerImage = loadImage(flowerFileName);
 flowerImage.resize(100,100);
}
void display(){
  imageMode(CENTER);
  image(flowerImage,Xpos,Ypos-105);
  for(r = 0; r<360;r++){
  rotate(radians(r));
  }
}
}
