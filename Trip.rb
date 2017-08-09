# Stores information about a driving trip
class Trip

	# Constructor - uses specified start time, end time and distance to create this Trip
	def initialize(start_time, end_time, distance)
		@start_time = start_time
		@end_time = end_time
		@distance = distance
	end
	
	# Make all attributes readable
	attr_reader :start_time
	attr_reader :end_time
	attr_reader :distance
end