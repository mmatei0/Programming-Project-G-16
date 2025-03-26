String[] airlines = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA" , "WN"};
float[] TotalFlights = {2412, 36630, 16309, 410, 5425, 5271, 15446, 4053, 654, 18979}; 

PImage bg;
PImage cloud;

float[] cloudX = new float[3];
float[] cloudY = new float[3];
float[] cloudSpeed = new float[3];
float[] cloudWidth = new float[3];
float[] cloudHeight = new float[3];

void setup() {
  size(752, 300); 
  smooth();
  bg = loadImage("background.png");
  
  cloud = loadImage("cloud.png");
  cloud.filter(BLUR, 1);
  
  for (int i = 0; i < 3; i++) {
    cloudX[i] = random(-100, width);
    cloudY[i] = random(30, 100);
    cloudSpeed[i] = random(0.5, 1.5);
    cloudWidth[i] = random(200, 300);
    cloudHeight[i] = cloudWidth[i] * 0.5;
  }
}

void draw() {
  image(bg, 0, 0, width, height);
  
  tint(255, 180);
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    translate(cloudX[i], cloudY[i]);
    scale(cloudWidth[i]/cloud.width);
    image(cloud, 0, 0);
    popMatrix();
    
    cloudX[i] += cloudSpeed[i];
    if (cloudX[i] > width + 300) {
      cloudX[i] = -300;
      cloudY[i] = random(30, 100);
    }
  }
  tint(255, 255);

  int chartH = height - 100;
  int chartW = width - 100;
  int barW = chartW / airlines.length; 
  int margin = 20;
  
  for (int i = 0; i < airlines.length; i++) {
    float barH = map(TotalFlights[i], 0, max(TotalFlights), 0, chartH);
    fill(100, 150, 255); 
    rect(margin + i * barW, height - barH - 40, barW - 10, barH); 
    fill(255);
    textAlign(CENTER, BOTTOM);
    text(airlines[i], margin + i * barW + barW / 2, height - 20);
  }
  
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Total number of flights based on airline", width / 2, 30);
  textSize(12);
  text("Airlines", width / 2.2, height - 10);
}
