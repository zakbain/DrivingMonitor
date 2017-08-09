load 'Tracker.rb'
load 'Trip.rb'
load 'SimpleTime.rb'

class Runner
  # String constants for possible commands
  DRIVER_CMD = "driver"
  TRIP_CMD = "trip"
  
  def initialize
    @root = Tracker.new()
  end
  
  def process_input(input)
    # Split the input by spaces to get its separate parts
    input_parts = input.split(" ")
    command = input_parts[0]
    
    # Handle a driver command
    if (command.downcase == DRIVER_CMD)
      # Get the driver 
      driver = input_parts[1]
      @root.add_new_driver(driver)
    end
    
    # Handle a trip command
    if (command.downcase == TRIP_CMD)
      # driver name will be the first word after "Trip"
      driver = input_parts[1]
      
      # split the HH:MM into [HH, MM]
      start_time_parts = input_parts[2].split(":")
      end_time_parts = input_parts[3].split(":")
      distance = input_parts[4].to_i
      
      # initialize times
      start_time = SimpleTime.new(start_time_parts[0].to_i, start_time_parts[1].to_i)
      end_time = SimpleTime.new(end_time_parts[0].to_i, end_time_parts[1].to_i)
      
      trip = Trip.new(start_time, end_time, distance)
      
      @root.record_new_trip(driver, trip)
    end
  end

  attr_reader :root
end

run = Runner.new()
run.process_input("Driver Zak")
run.process_input("Trip Dan 07:15 07:45 17.3")
run.process_input("Trip Dan 06:12 06:32 21.8")
run.process_input("Trip Alex 12:01 13:16 42")

driver_trips = run.root.driver_trips
    
puts run.root.report
puts run.root.to_s
