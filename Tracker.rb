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
  
  # Read trips
  attr_reader :driver_trips
end
