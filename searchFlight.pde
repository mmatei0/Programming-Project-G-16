class SearchFlight {  
    ArrayList<Flight> flights;
    
    SearchFlight(ArrayList<Flight> flights) {
        this.flights = flights;
    }
    
    ArrayList<Flight> searchByAirport(String airport) {  
        ArrayList<Flight> result = new ArrayList<Flight>();
        for(Flight flight : flights) {
            if (flight.origin.equalsIgnoreCase(airport)) {
                result.add(flight);
            }
        }
        return result;
    }

    ArrayList<Flight> searchByDateRange(String startDate, String endDate) { 
        ArrayList<Flight> result = new ArrayList<Flight>();
        for (Flight flight : flights) {  
            if (flight.date.compareTo(startDate) >= 0 && flight.date.compareTo(endDate) <= 0) {  
                result.add(flight);  
            }  
        }  
        return result;
    }  
    
    ArrayList<Flight> searchByLateness() {  
        ArrayList<Flight> sortedFlights = new ArrayList<Flight>(flights);  
        sortedFlights.sort((f1, f2) -> Integer.compare(f2.getLateness(), f1.getLateness()));
        return sortedFlights;
    }

    ArrayList<Flight> searchByCity(String city) {
        ArrayList<Flight> result = new ArrayList<Flight>();
        for (Flight flight : flights) {
            if (flight.originCity.equalsIgnoreCase(city) || 
                flight.destinationCity.equalsIgnoreCase(city)) {
                result.add(flight);
            }
        }
        return result;
    }

    ArrayList<Flight> searchByAirline(String airline) {
        ArrayList<Flight> result = new ArrayList<Flight>();
        for (Flight flight : flights) {
            if (flight.airlineCarrier.equalsIgnoreCase(airline)) {
                result.add(flight);
            }
        }
        return result;
    }
}
