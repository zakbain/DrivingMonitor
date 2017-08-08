load 'Trip.rb'
load 'Driver.rb'

class Tracker 
  # Default constructor - uses specified start and time to create this Trip
  def initialize()
    # Trips will be saved as hashmaps from driver to a trip
    @driver_trips = Hash.new
  end
  
  # Records a trip taken by a driver
  def record_new_trip(driver, trip) 
    driver_trips[driver] = trip
  end
  
  # Read trips
  attr_reader :driver_trips
end


#Create a trip
dan = Driver.new("Daniel")
zak = Driver.new("Zakariya")
first_trip = Trip.new(2, 5)
first_trip = Trip.new(400, 600)


# Create a driver and add the trip we created
root = Tracker.new()
root.record_new_trip(dan, first_trip)
puts root.driver_trips[dan].start_time
puts root.driver_trips[dan].end_time