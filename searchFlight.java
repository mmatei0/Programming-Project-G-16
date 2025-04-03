class FileDataReader {
       HashMap<String, Flight> readFlights(String fileName) {
         HashMap<String, Flight> flights = new HashMap<>();
 
         // Load all lines from the file
         String[] lines = loadStrings(fileName);
         
        // Limit to print first 100 lines
             
          if (lines == null)
           {
             println("Error loading file: " + fileName);
             return flights;
           }
           
          
         for (int rowNumber = 1; rowNumber < lines.length ; rowNumber++) {
             String[] row = lines[rowNumber].split(",");
 
             // Assign CSV values to variables (handling missing values)
             String date = row[0].isEmpty() ? "Unknown" : row[0];  
             String airlineCarrier = row[1].isEmpty() ? "Unknown" : row[1];  
             String flightNumber = row[2].isEmpty() ? "Unknown" : row[2];  
             String origin = row[3].isEmpty() ? "Unknown" : row[3]; 
             String originCity = row[4].isEmpty() ? "Unknown" : row[4];
             String originUnusedState = row[5].isEmpty() ? "Unknown" : row[5];
             String originState = row[6].isEmpty() ? "Unknown" : row[6];
             String originWAC = row[7].isEmpty() ? "Unknown" : row[7];
             String destination = row[8].isEmpty() ? "Unknown" : row[8];  
             String destinationCity = row[9].isEmpty() ? "Unknown" : row[9];
             String destinationUnusedState = row[10].isEmpty() ? "Unknown" : row[10];
             String destinationState = row[11].isEmpty() ? "Unknown" : row[11];
             String destinationWAC = row[12].isEmpty() ? "Unknown" : row[12];
             
             int scheduledDeparture = row[13].isEmpty() ? 0 : Integer.parseInt(row[13]);
             int actualDeparture = row[14].isEmpty() ? 0 : Integer.parseInt(row[14]);
             int scheduledArrival = row[15].isEmpty() ? 0 : Integer.parseInt(row[15]);
             int actualArrival = row[16].isEmpty() ? 0 : Integer.parseInt(row[16]);
             boolean cancelled = row[17].isEmpty() ? false : row[17].equals("1");
             boolean diverted = row[18].isEmpty() ? false : row[18].equals("1");
             int distance = row[19].isEmpty() ? 0 : Integer.parseInt(row[19]);
 
             // Create a Flight object
             Flight flight = new Flight(date, airlineCarrier, flightNumber, origin, originCity, originUnusedState, originState, originWAC,
                                        destination, destinationCity, destinationUnusedState, destinationState, destinationWAC,
                                        scheduledDeparture, actualDeparture, scheduledArrival, 
                                        actualArrival, cancelled, diverted, distance);
 
             // Store flight in HashMap (key = flight number, value = Flight object)
             flights.put(flightNumber, flight);      
         }
 
         return flights;
     }
 }
class Flight {
    // Fields to hold the flight details
     String date;
     String airlineCarrier;
     String flightNumber;
     String origin;
     String originCity;
     String originState;
     String originWAC;
     String destination;
     String destinationCity;
     String destinationState;
     String destinationWAC;
     int scheduledDeparture;
     int actualDeparture;
     int scheduledArrival;
     int actualArrival;
     int distance;
     boolean cancelled;
     boolean diverted;

    // Constructor to initialise the fields
    public Flight(String date, String airlineCarrier, String flightNumber, String origin, 
                  String originCity, String originUnusedState, String originState, String originWAC, String destination, 
                  String destinationCity, String destinationUnusedState, String destinationState, String destinationWAC, 
                  int scheduledDeparture, int actualDeparture, int scheduledArrival, 
                  int actualArrival, boolean cancelled, boolean diverted, int distance) 
{
        this.date = date;
        this.airlineCarrier = airlineCarrier;
        this.flightNumber = flightNumber;
        this.origin = origin;
        this.originCity = originCity;
        this.originState = originState;
        this.originWAC = originWAC;
        this.destination = destination;
        this.destinationCity = destinationCity;
        this.destinationState = destinationState;
        this.destinationWAC = destinationWAC;
        this.scheduledDeparture = scheduledDeparture;
        this.actualDeparture = actualDeparture;
        this.scheduledArrival = scheduledArrival;
        this.actualArrival = actualArrival;
        this.distance = distance;
        this.cancelled = cancelled;
        this.diverted = diverted;
    }
    
    
    //getter methods
    int getLateness(){
      return actualArrival - scheduledArrival;
    }
    
    String toString() {
    return "Flight " + this.flightNumber + " | " + this.origin + " | " + this.destination +
           " | " + this.date + " | " + this.airlineCarrier;
} 

}
class SearchFlight {  
 
  ArrayList<Flight> flights;
  
  SearchFlight(ArrayList <Flight> flights){
    this.flights = flights;
  }
  
    
// Query flights by origin airport using HashSet for fast lookup  
 ArrayList <Flight> searchByAirport(String airport) {  
    ArrayList <Flight> result = new ArrayList <> ();
    for(Flight flight : flights){
      if (flight.origin.equals(airport)) {
        result.add(flight);
      }
    }
    return result;
  }

// Query flights within a date range  
  ArrayList <Flight> searchByDateRange(String startDate, String endDate) { 
    
    ArrayList <Flight> result = new ArrayList <> ();
    for (Flight flight : flights) {  
        if (flight.date.compareTo(startDate) >= 0 && flight.date.compareTo(endDate) <= 0) {  
            result.add(flight);  
       }  
    }  
    return result;
}  
// Query flights sorted by lateness  
  ArrayList <Flight> searchByLateness() {  
    ArrayList <Flight> sortedFlights = new ArrayList <> (flights);  
     sortedFlights.sort((f1, f2) -> Integer.compare(f2.getLateness(), f1.getLateness()));
        return sortedFlights;
}

ArrayList<Flight> searchByDistance() {
    ArrayList<Flight> sortedFlights = new ArrayList<>(flights);
    sortedFlights.sort((f1, f2) -> Integer.compare(f2.distance, f1.distance)); // Sort descending
    return sortedFlights;
}
ArrayList<Flight> searchByAirline(String airline) {
        ArrayList<Flight> result = new ArrayList<>();
        for (Flight flight : flights) {
            if (flight.airlineCarrier.equalsIgnoreCase(airline)) {
                result.add(flight);
            }
        }
        return result;
    }
}
HashMap<String, Flight> flights;
void setup() {
  size(800, 600);
  
  // Step 1: Read flights from CSV
  FileDataReader fileDataReader = new FileDataReader();
  flights = fileDataReader.readFlights("flights2k(1).csv");

  // Convert HashMap values to ArrayList for searching
  ArrayList<Flight> flightList = new ArrayList<>(flights.values());

  // Step 2: Perform searches
  SearchFlight sf = new SearchFlight(flightList);
  
  // Example searches
  println("Flights from JFK: " + sf.searchByAirport("JFK"));
  println(" ");
  println("Late Flights: " + sf.searchByLateness());
  println(" ");
  println("Flight from: " + sf.searchByDateRange("01/01/2022", "01/04/2022"));
  println(" ");
  println("search by distance " + sf. searchByDistance());
  println (" ");
  println("search by airline " + sf.searchByAirline("AA"));
}
