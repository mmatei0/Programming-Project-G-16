final int CAPTION_TEXT = 50;
final int BUTTON_TEXT = 23;
int cloud1X, cloud2X, cloud3X, cloud4X, cloud5X, cloud6X;
int planeX, planeY;
PImage cloudImage, planeImage;
PFont titleFont;
Dropdown dropdown;
Button nextButton, backButton, homeButton;
String[] searchOptions = {"Airport", "Airline", "Date", "Lateness", "City"};
String selectedOption = "";
String currentSearchTerm = "";

// Screens: 0 = main menu, 1 = input, 2 = results
int screen = 0; 

// Input components
TextField inputAirportField, startDateField, endDateField, inputAirlineField, inputCitiesField;
Button searchButton, resetButton, graphButton, tableButton;

// Search data
ArrayList<Flight> searchResults = new ArrayList<Flight>();
SearchFlight searchFlight;
boolean showGraph = false;
boolean dateRangeSearch = false;
boolean latenessSearch = false;
boolean airlineSearch = false;
boolean citySearch = false;
boolean airportSearch = false;
int resultOffset = 0;

void setup() {
    size(1300, 800);
    titleFont = createFont("ArimaMadurai-Black-50.vlw", 50);
    textFont(createFont("Arial", 14));
    cloudImage = loadImage("cloudImage.png");
    planeImage = loadImage("planeImage.png");
    
    cloud1X = 95;
    cloud2X = 25;
    cloud3X = 230;
    cloud4X = 400;
    cloud5X = 498;
    cloud6X = 570;
    planeX = -120;
    planeY = 140;
    
    // Initialize UI components
    dropdown = new Dropdown(300, 200, 300, 40, searchOptions);
    nextButton = new Button(650, 200, 200, 40, "Search");
    backButton = new Button(20, 20, 80, 30, "Back");
    homeButton = new Button(20, 20, 80, 30, "Home");
    
    inputAirportField = new TextField(300, 200, 300, 40, "Search Airport...");
    inputAirlineField = new TextField(300, 200, 300, 40, "Search Airline...");
    inputCitiesField = new TextField(300, 200, 300, 40, "Search City...");
    startDateField = new TextField(300, 200, 140, 40, "DD/MM/YYYY");
    endDateField = new TextField(460, 200, 140, 40, "DD/MM/YYYY");
    
    searchButton = new Button(300, 260, 120, 40, "Search");
    resetButton = new Button(450, 260, 120, 40, "Reset");
    graphButton = new Button(width - 160, height - 50, 120, 35, "Graph View");
    tableButton = new Button(width - 300, height - 50, 120, 35, "Table View");
    
    // Initialize flight data
    HashMap<String, Flight> flights = new FileDataReader().readFlights("flights2k(1).csv");
    searchFlight = new SearchFlight(new ArrayList<Flight>(flights.values()));
}

void draw() {
    background(#87CEEB);
    drawClouds();
    drawPlane();
    
    fill(255);
    noStroke();
    rect(0, 0, width, 75);
    
    fill(0);
    textFont(titleFont);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("Flight Search", width/2, 40);
    
    if (screen == 2 && !showGraph) {
        fill(255);
        rect(0, 75, width, 40);
        fill(0);
        textSize(14);
        text("Currently viewing: " + selectedOption + " search results", width/2, 95);
    }
    
    textAlign(CENTER, CENTER);
    textSize(26);
    fill(255);

    switch(screen) {
        case 0: // Main menu
            textSize(35);
            text("FLIGHTS", width / 2, 120);
            dropdown.display();
            nextButton.display();
            break;
            
        case 1: // Input screen
            backButton.display();
            if (airportSearch) {
                text("AIRPORT", width/2, 120);
                inputAirportField.x = width/2 - 150;
                inputAirportField.display();
            } else if (airlineSearch) {
                text("AIRLINE", width/2, 120);
                inputAirlineField.x = width/2 - 150;
                inputAirlineField.display();
            } else if (dateRangeSearch) {
                text("DATE RANGE", width/2, 120);
                text("Start Date", width/2 - 150, 180);
                startDateField.x = width/2 - 150;
                startDateField.display();
                text("End Date", width/2 + 50, 180);
                endDateField.x = width/2 + 50;
                endDateField.display();
            } else if (citySearch) {
                text("CITIES", width/2, 120);
                inputCitiesField.x = width/2 - 150;
                inputCitiesField.display();
            } else if (latenessSearch) {
                // No additional input needed for lateness search
                text("LATENESS", width/2, 120);
                text("Showing all delayed flights", width/2, 160);
            }
            searchButton.x = width/2 - 130;
            resetButton.x = width/2 + 10;
            searchButton.display();
            resetButton.display();
            break;
            
        case 2: // Results screen
            backButton.display();
            if (searchResults.isEmpty()) {
                textAlign(CENTER);
                textSize(20);
                text("No matching flights found...", width/2, 150);
            } else {
                if (showGraph && !latenessSearch) {  // Don't show graph for lateness search
                    displayGraphView();
                } else {
                    displayTableView();
                }
            }
            break;
    }
}
void drawClouds() {
    image(cloudImage, cloud1X, 100, 100, 50);
    if (cloud1X-- == -100) cloud1X = width + 100;
    image(cloudImage, cloud2X, 200, 100, 50);
    if (cloud2X-- == -100) cloud2X = width + 100;
    image(cloudImage, cloud3X, 280, 100, 50);
    if (cloud3X-- == -100) cloud3X = width + 100;
    image(cloudImage, cloud4X, 330, 100, 50);
    if (cloud4X-- == -100) cloud4X = width + 100;
    image(cloudImage, cloud5X, 130, 100, 50);
    if (cloud5X-- == -100) cloud5X = width + 100;
    image(cloudImage, cloud6X, 225, 100, 50);
    if (cloud6X-- == -100) cloud6X = width + 100;
}

void drawPlane() {
    image(planeImage, planeX, planeY, 120, 55);
    if (planeX++ == width + 120) {
        planeX = -120;
        planeY = (int)random(100, height - 100);
    }
}
void mousePressed() {
  if (screen == 0) { // Main menu
    dropdown.handleClick(mouseX, mouseY);
    if (nextButton.isClicked(mouseX, mouseY) && !dropdown.getSelected().equals("")) {
      selectedOption = dropdown.getSelected();
      dateRangeSearch = selectedOption.equals("Date");
      latenessSearch = selectedOption.equals("Lateness");
      airlineSearch = selectedOption.equals("Airline");
      citySearch = selectedOption.equals("City");
      airportSearch = selectedOption.equals("Airport");
      screen = 1;
    }
  } else if (screen == 1) { // Input screen
    if (dateRangeSearch) {
      startDateField.handleClick(mouseX, mouseY);
      endDateField.handleClick(mouseX, mouseY);
    } else if (airlineSearch) {
      inputAirlineField.handleClick(mouseX, mouseY);
    } else if (citySearch) {
      inputCitiesField.handleClick(mouseX, mouseY);
    } else if (airportSearch) {
      inputAirportField.handleClick(mouseX, mouseY);
    }
    
    if (searchButton.isClicked(mouseX, mouseY)) {
      performSearch();
      screen = 2;
    } else if (resetButton.isClicked(mouseX, mouseY)) {
      if (dateRangeSearch) {
        startDateField.clear();
        endDateField.clear();
      } else if (airlineSearch) {
        inputAirlineField.clear();
      } else if (citySearch) {
        inputCitiesField.clear();
      } else if (airportSearch) {
        inputAirportField.clear();
      }
    } else if (backButton.isClicked(mouseX, mouseY)) {
      screen = 0;
    }
  } else if (screen == 2) { // Results screen
    if (homeButton.isClicked(mouseX, mouseY)) {
      screen = 0;
      showGraph = false;
    } else if (graphButton.isClicked(mouseX, mouseY)) {
      showGraph = true;
    } else if (tableButton.isClicked(mouseX, mouseY)) {
      showGraph = false;
    }
  }
}

void mouseMoved() {
  if (screen == 0) {
    nextButton.checkHover(mouseX, mouseY);
  } else if (screen == 1) {
    searchButton.checkHover(mouseX, mouseY);
    resetButton.checkHover(mouseX, mouseY);
    backButton.checkHover(mouseX, mouseY);
  } else if (screen == 2) {
    homeButton.checkHover(mouseX, mouseY);
    graphButton.checkHover(mouseX, mouseY);
    tableButton.checkHover(mouseX, mouseY);
  }
}

void keyPressed() {
  if (screen == 1) {
    if (dateRangeSearch) {
      startDateField.handleTyping(key);
      endDateField.handleTyping(key);
    } else if (airlineSearch) {
      inputAirlineField.handleTyping(key);
    } else if (citySearch) {
      inputCitiesField.handleTyping(key);
    } else if (airportSearch) {
      inputAirportField.handleTyping(key);
    }
  } else if (screen == 2) {
    if (keyCode == UP) {
      resultOffset = max(0, resultOffset - 1);
    } else if (keyCode == DOWN) {
      resultOffset = min(searchResults.size() - 10, resultOffset + 1);
    }
  }
}

void performSearch() {
  searchResults.clear();
  resultOffset = 0;
  
  searchResults.clear();
    resultOffset = 0;
    
    if (selectedOption.equals("Airport")) {
        currentSearchTerm = inputAirportField.getText().toUpperCase();
        searchResults = searchFlight.searchByAirport(currentSearchTerm);
    } else if (selectedOption.equals("Airline")) {
        currentSearchTerm = inputAirlineField.getText().toUpperCase();
        searchResults = searchFlight.searchByAirline(currentSearchTerm);
    } else if (selectedOption.equals("Date")) {
        searchResults = searchFlight.searchByDateRange(startDateField.getText(), endDateField.getText());
    } else if (selectedOption.equals("Lateness")) {
        searchResults = searchFlight.searchByLateness();
        showGraph = false; // Force table view for lateness results
    } else if (selectedOption.equals("City")) {
        currentSearchTerm = inputCitiesField.getText().trim();
        if (!currentSearchTerm.isEmpty()) {
            searchResults = searchFlight.searchByCity(currentSearchTerm);
        }
    }
}

void displayTableView() {
  background(230, 240, 255); // Light background
  
  // Header
  fill(70, 130, 180);
  rect(50, 100, width-100, 40, 5);
  fill(255);
  textSize(12);
  textAlign(LEFT, CENTER);
  
  // Column headers
  text("Date", 60, 120);
  text("Airline", 120, 120);
  text("Flight#", 200, 120);
  text("Origin", 260, 120);
  text("Origin \n City", 320, 120);
  text("Origin \n State", 390, 120);
  text("Destination", 440, 120);
  text("Destination \n City", 520, 120);
  text("Destination \n State", 620, 120);
  text("Scheduled \n Depature", 700, 120);
  text("Actual \n Depature", 780, 120);
  text("Scheduled \n Arrival", 860, 120);
  text("Actual \n Arrival", 940, 120);
  text("Lateness", 1020, 120);
  text("Distance", 1100, 120);
  text("Cancelled", 1180, 120);
  
  // Table rows
  int startRow = resultOffset;
  int endRow = min(startRow + 20, searchResults.size());
  
  for (int i = startRow; i < endRow; i++) {
    Flight f = searchResults.get(i);
    int y = 150 + (i - startRow) * 30;
    
    // Alternate row colors
    fill((i % 2 == 0) ? color(240, 248, 255) : color(225, 235, 245));
    rect(50, y, width-100, 30);
    
    // Flight data
    fill(0);
    textSize(10);
    text(f.date, 60, y + 15);
    text(f.airlineCarrier, 160, y + 15);
    text(f.flightNumber, 200, y + 15);
    text(f.origin, 260, y + 15);
    text(f.originCity, 320, y + 15);
    text(f.originState, 400, y + 15);
    text(f.destination, 440, y + 15);
    text(f.destinationCity, 510, y + 15);
    text(f.destinationState, 650, y + 15);
    text(nf(f.scheduledDeparture, 4), 710, y + 15);
    text(nf(f.actualDeparture, 4), 790, y + 15);
    text(nf(f.scheduledArrival, 4), 870, y + 15);
    text(nf(f.actualArrival, 4), 950, y + 15);
    text(f.getLateness() + "m", 1030, y + 15);
    text(f.distance + "mi", 1110, y + 15);
    text(f.cancelled ? "Yes" : "No", 1190, y + 15);
  }
  
  // Navigation info
  fill(0);
  textSize(12);
  text("Showing " + (startRow+1) + " to " + endRow + " of " + searchResults.size() + " flights", width/2, height-80);
  text("Use UP/DOWN arrows to scroll", width/2, height-60);
  
  // View toggle buttons
  graphButton.display();
  tableButton.display();
}

void displayGraphView() {
  background(40, 60, 100);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  
  if (airportSearch) {
    displayAirportGraph();
  } else if (citySearch) {
    displayCityGraph();
  } else if (airlineSearch) {
    displayAirlineGraph();
  }
  
  tableButton.display();
}

void displayAirportGraph() {
  text("Flights from " + currentSearchTerm, width/2, 60);
  
  HashMap<String, Integer> destinationCounts = new HashMap<String, Integer>();
  for (Flight f : searchResults) {
    String dest = f.destination;
    destinationCounts.put(dest, destinationCounts.getOrDefault(dest, 0) + 1);
  }
  
  drawBarChart(destinationCounts, "Top Destinations", color(100, 200, 255));
}

void displayCityGraph() {
  text("Flights from " + currentSearchTerm, width/2, 60);
  
  HashMap<String, Integer> airlineCounts = new HashMap<String, Integer>();
  for (Flight f : searchResults) {
    String airline = f.airlineCarrier;
    airlineCounts.put(airline, airlineCounts.getOrDefault(airline, 0) + 1);
  }
  
  drawBarChart(airlineCounts, "Airlines Serving City", color(255, 150, 100));
}

void displayAirlineGraph() {
  text("Flights for " + currentSearchTerm, width/2, 60);
  
  HashMap<String, Integer> aircraftCounts = new HashMap<String, Integer>();
  HashMap<String, Integer> routeCounts = new HashMap<String, Integer>();
  HashMap<String, Integer> dayCounts = new HashMap<String, Integer>();
  String[] days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
  
  for (Flight f : searchResults) {
    String aircraftType = f.flightNumber.substring(0, 1);
    aircraftCounts.put(aircraftType, aircraftCounts.getOrDefault(aircraftType, 0) + 1);
    
    String route = f.origin + "-" + f.destination;
    routeCounts.put(route, routeCounts.getOrDefault(route, 0) + 1);
    
    int dayHash = abs(f.date.hashCode()) % 7;
    dayCounts.put(days[dayHash], dayCounts.getOrDefault(days[dayHash], 0) + 1);
  }
  
  drawSmallMultipleChart(aircraftCounts, "Aircraft Types", 50, 120, 300, 200, color(100, 200, 255));
  drawSmallMultipleChart(routeCounts, "Top Routes", 400, 120, 300, 200, color(255, 150, 100));
  drawSmallMultipleChart(dayCounts, "Flights by Day", 750, 120, 300, 200, color(150, 255, 150));
  
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Total Flights: " + searchResults.size(), 50, 350);
  text("Cancellation Rate: " + nfc((float)countCancelled()/searchResults.size()*100, 1) + "%", 50, 380);
  text("Average Delay: " + nfc(avgDelay(), 1) + " mins", 50, 410);
}

void drawBarChart(HashMap<String, Integer> data, String title, color barColor) {
  ArrayList<String> labels = new ArrayList<String>(data.keySet());
  Collections.sort(labels);
  int maxCount = Collections.max(data.values());
  
  int barWidth = 40;
  int margin = 100;
  int graphHeight = 400;
  int baseY = height - 100;
  int spacing = 50;
  
  textSize(16);
  text(title, width/2, 90);
  
  for (int i = 0; i < min(labels.size(), 15); i++) {
    String label = labels.get(i);
    int count = data.get(label);
    float barHeight = map(count, 0, maxCount, 0, graphHeight);
    
    float x = margin + i * (barWidth + spacing);
    fill(barColor);
    rect(x, baseY - barHeight, barWidth, barHeight);
    
    fill(255);
    textSize(10);
    text(label, x + barWidth/2, baseY + 20);
    text(count, x + barWidth/2, baseY - barHeight - 10);
  }
  
  textAlign(RIGHT, CENTER);
  for (int i = 0; i <= 5; i++) {
    int value = (int)map(i, 0, 5, 0, maxCount);
    float y = baseY - map(i, 0, 5, 0, graphHeight);
    text(value, margin - 10, y);
  }
}

void drawSmallMultipleChart(HashMap<String, Integer> data, String title, float x, float y, float w, float h, color barColor) {
  fill(60, 80, 120);
  rect(x, y, w, h, 5);
  
  fill(255);
  textAlign(CENTER);
  textSize(12);
  text(title, x + w/2, y + 20);
  
  ArrayList<HashMap.Entry<String, Integer>> sorted = new ArrayList<HashMap.Entry<String, Integer>>(data.entrySet());
  Collections.sort(sorted, (a, b) -> b.getValue().compareTo(a.getValue()));
  
  float chartTop = y + 30;
  float chartHeight = h - 40;
  int maxValue = Collections.max(data.values());
  
  for (int i = 0; i < min(5, sorted.size()); i++) {
    String label = sorted.get(i).getKey();
    int value = sorted.get(i).getValue();
    float barHeight = map(value, 0, maxValue, 0, chartHeight);
    
    fill(barColor);
    rect(x + 10, chartTop + chartHeight - barHeight, w - 20, barHeight);
    
    fill(255);
    textAlign(LEFT);
    textSize(10);
    text(label + ": " + value, x + 15, chartTop + chartHeight - barHeight - 5);
  }
}

int countCancelled() {
  int count = 0;
  for (Flight f : searchResults) {
    if (f.cancelled) count++;
  }
  return count;
}

float avgDelay() {
  float total = 0;
  int count = 0;
  for (Flight f : searchResults) {
    if (!f.cancelled) {
      total += f.getLateness();
      count++;
    }
  }
  return count > 0 ? total/count : 0;
}
