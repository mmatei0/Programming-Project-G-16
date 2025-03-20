String[] airlines = { "AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN" };
int[] totalFlights = { 2 , 93, 33, 1, 4, 11, 14, 2, 0, 58 };

void setup() {
  size(600, 600);
  noStroke();
  background(#FFFFFF); 

  

  color[] sliceColors = {
    color(255, 99, 132),   // AA (Light Red)
    color(54, 162, 235),   // AS (Blue)
    color(255, 159, 64),   // B6 (Orange)
    color(75, 192, 192),   // DL (Teal)
    color(153, 102, 255),  // F9 (Purple)
    color(255, 205, 86),   // G4 (Yellow)
    color(75, 192, 192),   // HA (Teal)
    color(255, 159, 64),   // NK (Orange)
    color(54, 162, 235),   // UA (Blue)
    color(255, 99, 132)    // WN (Light Red)
  };
  
 
  float startAngle = 0;
  float totalFlightsSum = 0;
  

  for (int i = 0; i < totalFlights.length; i++) {
    totalFlightsSum += totalFlights[i];
  }


  for (int i = 0; i < airlines.length; i++) {
    float angle = map(totalFlights[i], 0, totalFlightsSum, 0, TWO_PI);
    
    fill(sliceColors[i]);
    
    arc(width / 2, height / 2, 300, 300, startAngle, startAngle + angle);
    
    startAngle += angle;
  }
  
  startAngle = 0;
  textSize(12);
  fill(0);
  for (int i = 0; i < airlines.length; i++) {
    float angle = map(totalFlights[i], 0, totalFlightsSum, 0, TWO_PI);
    float labelAngle = startAngle + angle / 2;
    
    float x = width / 2 + cos(labelAngle) * 180;  
    float y = height / 2 + sin(labelAngle) * 180; 
    

    text(airlines[i], x, y - 10); 


    text(totalFlights[i], x, y + 10); 

    startAngle += angle;
  }
}
