import java.util.ArrayList;

public class FileReader {
    public static ArrayList<Flight> readFlights(String fileName) {
        ArrayList<Flight> flights = new ArrayList<>();
  

        //Load all lines from the file
        String[] lines = loadStrings("data\flights2k.csv");
        
        for (int rowNumber = 1; rowNumber < lines.length; rowNumber++)
        {

               // Assign CSV values to variables (with checks for missing values)
                String date = row[0].isEmpty() ? "Unknown" : row[0];  
                String airlineCarrier = row[1].isEmpty() ? "Unknown" : row[1];  
                String flightNumber = row[2].isEmpty() ? "Unknown" : row[2];  
                String origin = row[3].isEmpty() ? "Unknown" : row[3]; 
                String originCity = row[4].isEmpty() ? "Unknown" : row[4];
                String originState = row[5].isEmpty() ? "Unknown" : row[5];
                String originWAC = row[6].isEmpty() ? "Unknown" : row[6];
                String destination = row[7].isEmpty() ? "Unknown" : row[7];  
                String destinationCity = row[8].isEmpty() ? "Unknown" : row[8];
                String destinationState = row[9].isEmpty() ? "Unknown" : row[9];
                String destinationWAC = row[10].isEmpty() ? "Unknown" : row[10];

                int scheduledDeparture = row[11].isEmpty() ? 0 : Integer.parseInt(row[11]);
                int actualDeparture = row[12].isEmpty() ? 0 : Integer.parseInt(row[12]);
                int scheduledArrival = row[13].isEmpty() ? 0 : Integer.parseInt(row[13]);
                int actualArrival = row[14].isEmpty() ? 0 : Integer.parseInt(row[14]);
                boolean cancelled = row[15].isEmpty() ? false : row[15].equals("1");
                boolean diverted = row[16].isEmpty() ? false : row[16].equals("1");
                int distance = row[17].isEmpty() ? 0 : Integer.parseInt(row[17]);

                // Create a Flight object
                Flight flight = new Flight(date, airlineCarrier, flightNumber, origin, originCity, originState, originWAC,
                                           destination, destinationCity, destinationState, destinationWAC,
                                           scheduledDeparture, actualDeparture, scheduledArrival, 
                                           actualArrival, distance, cancelled, diverted);
                flights.add(flight);
            }
      
        return flights;
    }
}
