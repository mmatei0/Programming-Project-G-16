public class Flight {
    // Fields to hold the flight details
    private String date;
    private String airlineCarrier;
    private String flightNumber;
    private String origin;
    private String originCity;
    private String originState;
    private String originWAC;
    private String destination;
    private String destinationCity;
    private String destinationState;
    private String destinationWAC;
    private int scheduledDeparture;
    private int actualDeparture;
    private int scheduledArrival;
    private int actualArrival;
    private int distance;
    private boolean cancelled;
    private boolean diverted;

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
    public String getDate() { return date; }
    public String getAirlineCarrier() { return airlineCarrier; }
    public String getFlightNumber() { return flightNumber; }
    public String getOrigin() { return origin; }
    public String getOriginCity() { return originCity; }
    public String getOriginState() { return originState; }
    public String getOriginWAC() { return originWAC; }
    public String getDestination() { return destination; }
    public String getDestinationCity() { return destinationCity; }
    public String getDestinationState() { return destinationState; }
    public String getDestinationWAC() { return destinationWAC; }
    public int getScheduledDeparture() { return scheduledDeparture; }
    public int getActualDeparture() { return actualDeparture; }
    public int getScheduledArrival() { return scheduledArrival; }
    public int getActualArrival() { return actualArrival; }
    public boolean isCancelled() { return cancelled; }
    public boolean isDiverted() { return diverted; }
    public int getDistance() { return distance; }
    
   @Override
  public String toString() {
    return "Flight " + this.flightNumber + " from " + this.origin + " to " + this.destination +
           " on " + this.date + " by " + this.airlineCarrier;
} 
}
