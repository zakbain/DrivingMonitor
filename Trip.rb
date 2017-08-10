# Stores information about a driving trip
class Trip

	# Constructor - uses specified start time, end time and distance to create this Trip
	def initialize(start_time, end_time, distance)
		@start_time = start_time
		@end_time = end_time
		@distance = distance
	end
	
	# Check equality by checking equality of start, end time, and trip
	def ==(other_trip)
	  @start_time == other_trip.start_time && @end_time == other_trip.end_time && @distance == other_trip.distance
	end
	
	# Make all attributes readable
	attr_reader :start_time
	attr_reader :end_time
	attr_reader :distance
end