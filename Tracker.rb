load 'Trip.rb'
load 'Driver.rb'

class Tracker 
  # Default constructor - uses specified start and time to create this Trip
  def initialize()
    # Trips will be saved as hashmaps from driver to an array of trips
    @driver_trips = Hash.new
  end
  
  # Records a trip taken by a driver
  def record_new_trip(driver, trip) 
    if driver_trips[driver]
      # If the driver key already exists in the hashmap, add the new trip to its list of trips
      driver_trips[driver].push(trip)
    else
      #Otherwise, create a new array for the driver with the new trip as its first entry
      driver_trips[driver] = [trip]
    end
  end
  
  # Override to_s function to report the trips by driver
  def to_s
    # Allocate the string that will contain driver names and trips
    trip_report = ""
        
    # Loop through and print 
    driver_trips.each do |driver, trips|
      # Print the driver name
      trip_report.concat(driver.name)
      
      # Loop through each trip for this driver and print the start and end time
      trips.each do |trip| 
        trip_report.concat("\t" + trip.start_time.to_s + "\t" + trip.end_time.to_s + "\t" +  trip.distance.to_s)
      end
      
      # Add a newline so that each driver gets his own line
      trip_report << "\n"
    end
    
    # Return the trip report
    trip_report
  end
  
  # Read trips
  attr_reader :driver_trips
end
