class Flight {
    // Fields to hold the flight details
    String date;
    String airlineCarrier;
    String flightNumber;
    String origin;
    String originCity;
    String originUnusedState;
    String originState;
    String originWAC;
    String destination;
    String destinationCity;
    String destinationUnusedState;
    String destinationState;
    String destinationWAC;
    int scheduledDeparture;
    int actualDeparture;
    int scheduledArrival;
    int actualArrival;
    int distance;
    boolean cancelled;
    boolean diverted;

    // Constructor
    public Flight(String date, String airlineCarrier, String flightNumber, String origin, 
                String originCity, String originUnusedState, String originState, String originWAC, 
                String destination, String destinationCity, String destinationUnusedState, 
                String destinationState, String destinationWAC, int scheduledDeparture, 
                int actualDeparture, int scheduledArrival, int actualArrival, 
                boolean cancelled, boolean diverted, int distance) {
        this.date = date;
        this.airlineCarrier = airlineCarrier;
        this.flightNumber = flightNumber;
        this.origin = origin;
        this.originCity = originCity;
        this.originUnusedState = originUnusedState;
        this.originState = originState;
        this.originWAC = originWAC;
        this.destination = destination;
        this.destinationCity = destinationCity;
        this.destinationUnusedState = destinationUnusedState;
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
    
    // Calculate lateness in minutes
    int getLateness() {
        return actualArrival - scheduledArrival;
    }
    
    // String representation of flight
    String toString() {
        return this.date + " | " + this.airlineCarrier + " | " + this.flightNumber + " | " + 
               this.origin + " | " + this.originCity + " | " + this.originState + " | " + 
               this.destination + " | " + this.destinationCity + " | " + this.destinationState + " | " + 
               nf(this.scheduledDeparture, 4) + " | " + nf(this.actualDeparture, 4) + " | " + 
               nf(this.scheduledArrival, 4) + " | " + nf(this.actualArrival, 4) + " | " + 
               this.distance + " | " + (this.cancelled ? "Yes" : "No");
    }
}
