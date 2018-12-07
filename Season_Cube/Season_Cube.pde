float scale = 2119;
PImage tex;
float rotx = -0.054601327;

float roty = PI / 4;
PImage fall;
PImage rain;
PImage spring;
PImage snowy;
PImage hedge;
//leaf stuff

PShape leaf;
Leaf[] leafList = new Leaf[1];
PImage Snowy;
Snow[] snowList = new Snow[20];
PImage rainy;
Rain[] rainList = new Rain[340]; 
int seperation;
int spacing;
int i=0;
int j=0;
float Xpos;
float Ypos;
float Zpos=0;
int Yspeed;
float Spacing;
int Xrotation;
//wnd of leaf stuff

PShape Seeds;
Seed[] seedList = new Seed[1];
void setup() {
  size(displayWidth, displayHeight, P3D);
  snowy = loadImage("Snowy.jpg");
  fall = loadImage("fall.jpg");

  hedge = loadImage("hedge.jpg");
  spring = loadImage("Dandelion.jpg");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44, 48, 32));
  for (int i = 0; i<leafList.length; i++) {
    leafList[i] = new Leaf( 2*(i)*random(-20, 20), 0, 5, (int)random(4, 5), (int) random(360));
  }
  leaf = loadShape("SM_Leaf_21.obj");
  leaf.scale(500);
  leaf.setFill(color(random(255), random(200), 0));
  Snowy = loadImage("Snowy.jpg");
  Snowy.resize(height, height);
  for (int i = 0; i<20; i++) {
    snowList[i] = new Snow((i*72)-(width/2), (int)random(-50, 0), (int)random(20, 50), (int)random(2, 5));
  }
  for (int k = 0; k < 34; k ++ ) {
    seperation = 0;
    for (int j = 0; j < 10; j ++ ) {
      rainList[j*34+k] = new Rain(j*seperation, i*spacing);
      seperation = 130;
    }
    spacing = -75;
  }
  rainy = loadImage("rain.jpg");
  loadPixels();  // Since we are going to access the image's pixels too
  rainy.loadPixels(); // We must also call loadPixels() on the PImage since we are going to read its pixels.
  for (int y = 0; y < rainy.height; y++ ) {
    for (int x = 0; x < rainy.width; x++ ) {
      int loc = x + y*(rainy.width);
      // Image Processing Algorithm would go here
      float r = red(rainy.pixels [loc]); // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float g = green(rainy.pixels[loc]);
      float b = blue(rainy.pixels[loc]);
      float adjustBrightness = 255;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness; 
      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255); 
      b = constrain(b, 0, 255);

      // Set the display pixel to the image pixel
      color c = color(r, g, b);
      //pixels [loc] = c;
    }
  }
  for (int h = 0; h < seedList.length; h++) {
    seedList[h] = new Seed(width/2, height/2, -10, 10);
  }
  Seeds = loadShape("Seeds.obj");
  Seeds.setFill(color(255));
  //Seeds.scale(Scale);
}
void draw() {
  background(0);
  noStroke();
  pushMatrix();
  translate(width/ 2.0, height / 2.0/* Zpos*/);
  rotateX(rotx);
  rotateY(roty);
  //rotx = rotx +.025;
  //roty= roty +.025;
  //roty+=0.007;
  rotx = constrain(rotx, -7, 7);
  if (rotx == 7) {
    rotx = 0.7;
  }
  roty = constrain(roty, -5.504625, 8);
  if (roty==-5.50462||roty>=7) {
    roty=-0.054601327;
  }
  /*if(roty>=5){
   roty=0;
   }*/
  println("rotx: "+ rotx);
  println("roty: "+ roty);
  scale(scale);
  TexturedCube(fall, rain, hedge, snowy, spring);
  popMatrix();
  leaves();
  snow();
  for (int h = 0; h < seedList.length; h ++ ) {
    seedList[h].display();
    seedList[h].grow();
    seedList[h].move();
    seedList[h].repeat();
  }
  
  translate(-(width/2), 0);
  rain();
  //danelion
}
void TexturedCube(PImage fall, PImage rain, PImage hedge, PImage snowy, PImage spring) {
  beginShape(QUADS);
  texture(fall);

  // Given one texture and six faces, we can easily set up the uv coordinates 
  // such that four of the faces tile "perfectly" along either u or v, but the other 
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces 
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a 
  // rotation along the X axis will put the "top" of either texture at the "top" 
  // of the screen, but is not otherwise aligned with the X/Z faces. (This 
  // just affects what type of symmetry is required if you need seamless 
  // tiling all the way around the cube)

  // +Z "front" face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();
  beginShape(QUADS);
  if (keyPressed == true) {
    //rainy.updatePixels();
  } else if (keyPressed == false) {
    texture(rainy);
  }
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(hedge);
  // +Y "bottom" face
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(snowy);
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(spring);
  // +X "right" face
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  endShape();
}
void mouseDragged() {
  float rate = .01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
  if (rotx>7) {
    rotx=0;
  }
  if (roty>=5) {
    roty=0;
  }
}
void mouseWheel(MouseEvent event) {
  //float rate = .01;
  //float e = event.getCount();
  //println(e);
  //println("scale: "+scale);
  //scale = scale + e*rate;
  //scale = constrain(scale, 946, 6257);
  //println("Zpos: "+ Zpos);
  //Zpos = Zpos + e*rate;
  //Zpos = constrain(scale, 946, 6257);
}
void keyPressed() {
  Leaf oneMoreLeaf = new Leaf(random(-(width/2), 720), 0, 10, (int) random(2, 5), (int)random(360));
  leafList = (Leaf[]) append(leafList, oneMoreLeaf);
  Snow oneMoreFlake = new Snow((int)random(-(width/2), 720), 0, (int) random(30.50), (int)random(2, 5));
  snowList = (Snow[]) append(snowList, oneMoreFlake);
}
void leaves() {
  translate(width/2, 0/*650*/);
  for (int i = 0; i < leafList.length; i ++ ) {
    if (roty >= 2.7453876 && roty <= 3.5153868 && rotx<=0.055399053 && rotx>= -1.4945997) {
      leafList[i].display();
      leafList[i].move(); 
      leafList[i].repeat();
    }
  }
}
void snow() {
  translate(0, 0);
  if (rotx <= 2.9299982 && rotx>= 0) {
    for (int i = 0; i < snowList.length; i ++ ) {
      snowList[i].display();
      snowList[i].move(); 
      snowList[i].repeat();
    }
  }
}
void rain() {
  translate(0, 0);
  for (int i = 0; i < rainList.length; i ++ ) {
    rainList[i].display();
    rainList[i].move();
    rainList[i].repeat();
  }
}