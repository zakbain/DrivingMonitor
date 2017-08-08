# Stores information about a driving trip
class Trip

	# Constructor - uses specified start and time to create this Trip
	def initialize(start_time, end_time)
		@start_time = start_time
		@end_time = end_time
	end
	
	attr_reader :start_time
	attr_reader :end_time
end