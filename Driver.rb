load 'Trip.rb'

class Driver
	# Default constructor - uses specified start and time to create this Trip
	def initialize()
		@trips = []
	end
	
	def add_trip(trip)
		@trips.push(trip)
	end
	
	# Read trips
	attr_reader :trips
end

#Create a trip
first_trip = Trip.new(2, 5)

# Create a driver and add the trip we created
daniel = Driver.new()
daniel.add_trip(first_trip)
puts daniel.trips[0].start_time