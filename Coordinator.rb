load 'Tracker.rb'
load 'Trip.rb'
load 'SimpleTime.rb'

class Coordinator
  # String constants for possible commands
  DRIVER_CMD = "driver"
  TRIP_CMD = "trip"
  
  def initialize(tracker)
    @tracker = tracker
  end
  
  def process_input(input)
    # Split the input by spaces to get its separate parts
    input_parts = input.split(" ")
    command = input_parts[0]
    
    # Handle a driver command but only if there are enough attributes
    if (command.downcase == DRIVER_CMD && input_parts.length >= 2)
      # Get the driver 
      driver = input_parts[1]
      @tracker.add_new_driver(driver)
    end
    
    # Handle a trip command but only if there are enough attributes
    if (command.downcase == TRIP_CMD && input_parts.length >= 5)
      # driver name will be the first word after "Trip"
      driver = input_parts[1]
      
      # split the HH:MM into [HH, MM]
      start_time_parts = input_parts[2].split(":")
      end_time_parts = input_parts[3].split(":")
      distance = input_parts[4].to_f
      
      # Surround with begin to catch errors with integer parsing
      begin
        # Convert the cmd args into integers. Use Integer so that bad input throws errors
        start_time_hours = Integer(start_time_parts[0])
        start_time_minutes= Integer(start_time_parts[1])
        end_time_hours = Integer(end_time_parts[0])
        end_time_minutes = Integer(end_time_parts[1])
        
        # Create the start and end then create the trip
        start_time = SimpleTime.new(start_time_hours, start_time_minutes)
        end_time = SimpleTime.new(end_time_hours, end_time_minutes)
        trip = Trip.new(start_time, end_time, distance)
      
        @tracker.record_new_trip(driver, trip)
      rescue
        puts "WARNING: failed to convert hours and minutes to integers"        
      end
      
    end
  end

  def get_tracking_report
    @tracker.report
  end
  
  def get_tracking_summary
    @tracker.to_s
  end

  attr_reader :tracker
end


