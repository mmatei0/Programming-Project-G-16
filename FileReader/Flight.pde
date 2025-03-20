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

    // Constructor to initialize the fields
    public Flight(String date, String airlineCarrier, String flightNumber, String origin, 
                  String originCity, String originState, String originWAC, String destination, 
                  String destinationCity, String destinationState, String destinationWAC, 
                  int scheduledDeparture, int actualDeparture, int scheduledArrival, 
                  int actualArrival, int distance, boolean cancelled, boolean diverted) 
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

//ANY GETTERS OR SETTERS GO HERE
