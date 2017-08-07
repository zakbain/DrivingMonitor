class Trip

	# Default constructor - uses specified start and time to create this Trip
	def initialize(start_time, end_time)
		@start_time = start_time
		@end_time = end_time
	end
	
	attr_reader :start_time
end

firstTrip = Trip.new(2, 5)
p firstTrip.start_time