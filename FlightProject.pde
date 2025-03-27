import java.util.*;

FileDataReader fileDataReader;
HashMap<String, Flight> flights;

void setup() {
  size(800, 600); 
  
  // Step 1: Create the reader
  fileDataReader = new FileDataReader();
  
  // Step 2: Read the CSV file and store the result in 'flights'
  flights = fileDataReader.readFlights("data/flights2k.csv");  // Make sure the path is correct
  
  
   // Step 2: Print a few flights to check
  println("Total Flights Loaded: " + flights.size());

  //int limit = 10;
  //for (String flightNum : flights.keySet()) {
  //  Flight f = flights.get(flightNum);
  //  println(f);
  //  // stop after printing first 5 flights
  //  if (--limit == 0) break;
  
  // Step 3: Now, i can pass the 'flights' HashMap to Jennifer's FlightDatabase
  
}

}
