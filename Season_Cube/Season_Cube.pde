PImage fall;
float rotx = PI/4;
float roty = PI/4;
float scale = 400;
int maxImages = 3;
int imageIndex = 0;
PShape leaf;
Leaf[] leafList = new Leaf[20];
PImage[] images = new PImage[maxImages];
void setup(){
size(displayWidth,displayHeight, P3D);
  for(int i = 0; i<images.length; i ++){
images[i] = loadImage("image" + i + ".jpg");
}
  fall = loadImage("fall.jpg");
    for (int j = 0; j<20 ;j++){
   leafList[j] = new Leaf( j*72,(int)random(-30,0),0,(int)random(2,5),(int) random(360));
   leaf = loadShape("SM_Leaf_21.obj");
   leaf.scale(500);
   leaf.setFill(color(random(255),random(200),0));
}
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
}

void draw() {
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(scale);
  TexturedCube();
       for (int j = 0; j < leafList.length; j ++ ) {
    leafList[j].display();
    leafList[j].move(); 
    leafList[j].repeat();
   }
   }

void TexturedCube() {
beginShape(QUADS);
 texture(images[0]);


// +Z "front" face
vertex(-1, -1,  1, 0, 0);
vertex( 1, -1,  1, 1, 0);
vertex( 1,  1,  1, 1, 1);
vertex(-1,  1,  1, 0, 1);
endShape();
beginShape(QUADS);
texture(images[1]);
// -Z "back" face
vertex( 1, -1, -1, 0, 0);
vertex(-1, -1, -1, 1, 0);
vertex(-1,  1, -1, 1, 1);
vertex( 1,  1, -1, 0, 1);
endShape();
beginShape(QUADS);
texture(images[2]);

// +Y "bottom" face
vertex(-1,  1,  1, 0, 0);
vertex( 1,  1,  1, 1, 0);
vertex( 1,  1, -1, 1, 1);
vertex(-1,  1, -1, 0, 1);
// -Y "top" face
vertex(-1, -1, -1, 0, 0);
vertex( 1, -1, -1, 1, 0);
vertex( 1, -1,  1, 1, 1);
vertex(-1, -1,  1, 0, 1);

// +X "right" face
vertex( 1, -1,  1, 0, 0);
vertex( 1, -1, -1, 1, 0);
vertex( 1,  1, -1, 1, 1);
vertex( 1,  1,  1, 0, 1);

// -X "left" face
vertex(-1, -1, -1, 0, 0);
vertex(-1, -1,  1, 1, 0);
vertex(-1,  1,  1, 1, 1);
vertex(-1,  1, -1, 0, 1);

endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  scale = scale + e;
}