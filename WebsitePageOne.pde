final int CAPTION_TEXT = 50;
final int BUTTON_TEXT = 23;


void setup() {
  size(700, 300);
  background(250);
}

void draw() {
  fill(200);
  noStroke();
  rect(0, 0, 700, 75);
  
  fill(0);
  textSize(CAPTION_TEXT);
  textAlign(CENTER, TOP);
  text("Welcome to Flight Search", 350, 25);
  
  textSize(35);
  text("Choose an option", 350, 80);
  
  textSize(BUTTON_TEXT);
  textAlign(LEFT, TOP);
  text("- Search flights by airport", 220, 135);
  text("- Search flights by date", 220, 165);
  text("- Search flights by lateness", 220, 195);
}
