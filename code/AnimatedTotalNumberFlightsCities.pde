String[] cities = {
  "Albany, NY", "Albuquerque, NM", "Anchorage, AK", "Appleton, WI", "Atlanta, GA", "Austin, TX", 
  "Baltimore, MD", "Barrow, AK", "Belleville, IL", "Bellingham, WA", "Bethel, AK", "Billings, MT", 
  "Birmingham, AL", "Bismarck/Mandan, ND", "Boise, ID", "Boston, MA", "Bozeman, MT", "Buffalo, NY", 
  "Burbank, CA", "Cedar Rapids/Iowa City, IA", "Charleston, SC", "Charlotte, NC", "Chicago, IL", 
  "Cincinnati, OH", "Cleveland, OH", "Columbus, OH", "Cordova, AK", "Corpus Christi, TX", "Dallas, TX", 
  "Dallas/Fort Worth, TX", "Deadhorse, AK", "Denver, CO", "Detroit, MI", "El Paso, TX", "Eugene, OR", 
  "Fairbanks, AK", "Fargo, ND", "Fayetteville, AR", "Fort Lauderdale, FL", "Fort Myers, FL", "Fresno, CA", 
  "Grand Junction, CO", "Great Falls, MT", "Greer, SC", "Hartford, CT", "Hilo, HI", "Honolulu, HI", 
  "Houston, TX", "Idaho Falls, ID", "Indianapolis, IN", "Jackson/Vicksburg, MS", "Jacksonville, FL", 
  "Juneau, AK", "Kahului, HI", "Kansas City, MO", "Ketchikan, AK", "Kodiak, AK", "Kona, HI", "Las Vegas, NV", 
  "Lihue, HI", "Long Beach, CA", "Los Angeles, CA", "Louisville, KY", "Medford, OR", "Memphis, TN", 
  "Miami, FL", "Midland/Odessa, TX", "Milwaukee, WI", "Minneapolis, MN", "Minot, ND", "Mission/McAllen/Edinburg, TX", 
  "Missoula, MT", "Myrtle Beach, SC", "Nashville, TN", "New Orleans, LA", "New York, NY", "Newark, NJ", 
  "Oakland, CA", "Oklahoma City, OK", "Ontario, CA", "Orlando, FL", "Palm Springs, CA", "Peoria, IL", 
  "Petersburg, AK", "Philadelphia, PA", "Phoenix, AZ", "Pittsburgh, PA", "Portland, OR", "Raleigh/Durham, NC", 
  "Rapid City, SD", "Reno, NV", "Rockford, IL", "Sacramento, CA", "Salt Lake City, UT", "San Antonio, TX", 
  "San Diego, CA", "San Francisco, CA", "San Jose, CA", "San Juan, PR", "Santa Ana, CA", "Santa Maria, CA", 
  "Sarasota/Bradenton, FL", "Savannah, GA", "Seattle, WA", "Sitka, AK", "Spokane, WA", "Springfield, MO", 
  "St. Louis, MO", "Stockton, CA", "Tampa, FL", "Tulsa, OK", "Valparaiso, FL", "Washington, DC", 
  "West Palm Beach/Palm Beach, FL", "White Plains, NY", "Wrangell, AK", "Yakutat, AK", 
};

int[] totalFlights = {
  435, 812, 7578, 3, 1450, 328, 255, 300, 91, 99, 540, 80, 79, 162, 154, 2616, 323, 441, 206, 113, 518, 255, 
  2103, 100, 91, 86, 635, 314, 2433, 57, 216, 2147, 555, 16, 123, 216, 214, 63, 1959, 48, 144, 65, 36, 64, 
  268, 404, 4130, 2430, 15, 228, 88, 60, 3440, 2983, 247, 2124, 294, 1287, 3441, 1076, 807, 3963, 26, 105, 
  443, 178, 80, 406, 164, 42, 118, 68, 1012, 574, 212, 6378, 1859, 867, 34, 473, 3686, 175, 46, 645, 1044, 
  1993, 22, 2412, 822, 48, 563, 50, 417, 848, 427, 1033, 1065, 812, 2726, 396, 58, 48, 150, 11049, 1212, 
  819, 56, 237, 226, 598, 64, 208, 716, 696, 95, 645, 635, 
};

int barWidth; 
int hoveredIndex = -1; 
String xAxisTitle = "Cities"; 
String middleText = "Total Flights by City"; 
PImage newyork;
PImage plane;

float planeX, planeY;
float planeSpeed = 2;
float planeSize = 0.05;

void setup() {
  size(1280, 700);
  barWidth = width / (cities.length + 2);
  textSize(12);
  plane = loadImage("plane.png");
  newyork = loadImage("newyork.png");
  planeX = -plane.width * planeSize;
  planeY = height * 0.2;
}

void draw() {
  background(newyork);
  
  planeX += planeSpeed;
  planeY += sin(frameCount * 0.05) * 0.5;
  if (planeX > width + plane.width * planeSize) {
    planeX = -plane.width * planeSize;
    planeY = height * (0.15 + random(0.1));
  }
  
  pushMatrix();
  translate(planeX, planeY);
  scale(planeSize);
  imageMode(CORNER);
  image(plane, 0, 0);
  popMatrix();

  int chartLeftMargin = (width - (cities.length * barWidth)) / 2;
  
  for (int i = 0; i < cities.length; i++) {
    if (i == hoveredIndex) {
      fill(0, 0, 255);
    } else {
      fill(0, 0, 0, 150);
    }

    int barHeight = (int) map(totalFlights[i], 0, max(totalFlights), 0, height - 100); 
    rect(chartLeftMargin + i * barWidth, height - barHeight - 50, barWidth, barHeight);

    if (i == hoveredIndex) {
      fill(255);
      textAlign(CENTER);
      text(cities[i] + ": " + totalFlights[i], mouseX, mouseY - 10);
    }
  }

  fill(255);
  textSize(20);
  textAlign(CENTER);
  text(xAxisTitle, width / 2, height - 10); 

  fill(255);
  textSize(15); 
  textAlign(CENTER, CENTER);
  text(middleText, width / 2, height / 2); 
}

void mouseMoved() {
  int chartLeftMargin = (width - (cities.length * barWidth)) / 2;
  hoveredIndex = (mouseX - chartLeftMargin) / barWidth;
  if (hoveredIndex >= cities.length || hoveredIndex < 0) {
    hoveredIndex = -1; 
  }
}
