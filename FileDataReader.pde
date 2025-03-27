
class FileDataReader {
    public HashMap<String, Flight> readFlights(String fileName) {
        HashMap<String, Flight> flights = new HashMap<>();

        // Load all lines from the file
        String[] lines = loadStrings(fileName);
        
        int limit = 100;  // Limit to print first 100 lines
            
         if (lines == null)
          {
      println("Error loading file: " + fileName);
      return flights;
          }

        for (int rowNumber = 1; rowNumber < lines.length; rowNumber++) {
          
      
          
          if (rowNumber>=limit) break;
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
            int scheduledDeparture = row[13].isEmpty() ? 0 : int(row[11]);
            int actualDeparture = row[14].isEmpty() ? 0 : int(row[12]);
            int scheduledArrival = row[15].isEmpty() ? 0 : int(row[13]);
            int actualArrival = row[16].isEmpty() ? 0 : int(row[14]);
            boolean cancelled = row[17].isEmpty() ? false : row[15].equals("1");
            boolean diverted = row[18].isEmpty() ? false : row[16].equals("1");
            int distance = row[19].isEmpty() ? 0 : int(row[17]);

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
