String[] airlines = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA" , "WN"};

float[] TotalFlights = {2412, 36630, 16309, 410, 5425, 5271, 15446, 4053, 654, 18979}; 

void setup() {
  size(600, 400); 
  background(255); 
  
  

  int chartHeight = height - 100;
  int chartWidth = width - 100;
  int barWidth = chartWidth / airlines.length; 
  int margin = 20;
  
  
  for (int i = 0; i < airlines.length; i++) {
    float barHeight = map(TotalFlights[i], 0, max(TotalFlights), 0, chartHeight); //
    
    
    fill(100, 150, 255); 
    rect(margin + i * barWidth, height - barHeight - 40, barWidth - 10, barHeight); 
    

    fill(0);
    textAlign(CENTER, BOTTOM);
    text(airlines[i], margin + i * barWidth + barWidth / 2, height - 20);
  }
  
  
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Total number of flights based on airline", width / 2, 30);
  textSize(12);
  text("Airlines", width / 2, height - 5);
  textSize(12);
 
}
