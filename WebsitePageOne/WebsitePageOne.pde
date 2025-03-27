final int CAPTION_TEXT = 50;
final int BUTTON_TEXT = 23;
int x;
int y;
int a;
int b;
int c;
int d;
int e;
int f;



void setup() {
  frameRate(140);
  size(700, 400);
  x = 70;
  y = 140;
  a = 95;
  b = 25;
  c = 230;
  d = 400;
  e = 498;
  f = 570;
}

void draw() {
  PFont myFont = loadFont("ArimaMadurai-Black-50.vlw");
  PImage cloudImage = loadImage("cloudImage.png");
  PImage planeImage = loadImage("planeImage.png");
  //background(167, 199, 231);
  background(#87CEEB);
  //background(#B0DCEF);
  
  fill(255);
  noStroke();
  rect(0, 0, 700, 75);
  
  image(cloudImage, a, 100, 100, 50);
    if (a--==-100) a = 705;
  image(cloudImage, b, 200, 100, 50);
    if (b--==-100) b = 705;
  image(cloudImage, c, 280, 100, 50);
    if (c--==-100) c = 705;
  image(cloudImage, d, 330, 100, 50);
    if (d--==-100) d = 705;
  image(cloudImage, e, 130, 100, 50);
    if (e--==-100) e = 705;
  image(cloudImage, f, 225, 100, 50);
    if (f--==-100) f = 705;
  
  
  image(planeImage, x, y, 120, 55);
   if (x++==700) x = -13;
   if (x==700) y = int(random(100, 340));
  
  fill(0);
  textSize(CAPTION_TEXT);
  textAlign(CENTER, TOP);
  textFont(myFont);
  text("Welcome to Flight Search", 350, 25);
  
  fill(255);
  textSize(35);
  text("Choose an option", 350, 90);
  
  textSize(BUTTON_TEXT);
  textAlign(LEFT, TOP);
  text("- Search flights by airport", 220, 145);
  text("- Search flights by date", 220, 175);
  text("- Search flights by lateness", 220, 205);
}
