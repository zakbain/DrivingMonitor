load 'Tracker.rb'
load 'Trip.rb'
load 'Driver.rb'

# String constant for possible commands
DRIVER_CMD = "driver"
TRIP_CMD = "trip"

@root = Tracker.new()

def process_input(input)
  # Split the input by spaces to get its separate parts
  input_parts = input.split(" ")
  command = input_parts[0]
  
  # Handle a driver command
  if (command.downcase == DRIVER_CMD)
  end
  
  # Handle a trip command
  if (command.downcase == TRIP_CMD)
    driver = Driver.new(input_parts[1])
    trip = Trip.new(input_parts[2], input_parts[3], input_parts[4])
    
    @root.record_new_trip(driver, trip)
  end
end

process_input("Trip Dan 07:15 07:45 17.3")

driver_trips = @root.driver_trips
    
puts @root.to_s