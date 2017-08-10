load 'Trip.rb'

class Tracker 
  # Default constructor - uses specified start and time to create this Trip
  def initialize
    # Trips will be saved as hashmaps from driver to an array of trips
    @driver_trips = Hash.new
  end
  
  # Adds a new driver to be tracked
  def add_new_driver(driver)
    # Check that the driver name is not empty
    if !driver.empty? 
      if get_trips(driver)
        # Can't add a driver that already exists
         puts "WARNING: " + driver + " already exists in tracker" 
      else
        # otherwise, create a new empty array for the driver
        @driver_trips[driver] = []
      end
    end
  end
  
  # Checks that a driver is being tracked
  def is_driver_tracked(driver)
    return get_trips(driver) != nil
  end
  
  # Records a trip taken by a driver
  def record_new_trip(driver, trip) 
    if get_trips(driver)
      # If the driver key already exists in the hashmap, add the new trip to its list of trips
      @driver_trips[driver].push(trip)
    else
      #Otherwise, create a new array for the driver with the new trip as its first entry
      @driver_trips[driver] = [trip]
    end
  end
  
  # Gets the trips for a given driver
  def get_trips(driver)
    @driver_trips[driver]
  end
  
  # Static method to calculate MPH based on given trips
  def self.calculate_MPH(trips)
    total_dist = 0
    total_minutes = 0
    
    # Loop through each trip to get the total time driven and total distance
    trips.each do |trip| 
        # total minutes is 60 * total
        total_minutes += (60 * trip.end_time.hours + trip.end_time.minutes) - (60 * trip.start_time.hours + trip.start_time.minutes)
        total_dist += trip.distance
    end
    
    # Only perform math if the driver has driven more than 0 minutes
    if total_minutes > 0
      # Miles / Hour = 60 * Miles / Minutes
      (60*total_dist)/total_minutes
    else
      # 0 if they have no minutes driven
      0
    end
  end
  
  def self.calculate_total_distance(trips)
    total_dist = 0
    
    # Loop through each trip and sum the total distance
    trips.each do |trip| 
        total_dist += trip.distance
    end
    
    total_dist
  end
  
  def report
    # Allocate the string that will contain driver names and trips
    result = ""
        
    # Loop through and add to summary 
    @driver_trips.each do |driver, trips|
      result.concat(driver, ": ")
      
      # Calculate total distance and concat to result
      total_dist = Tracker.calculate_total_distance(trips)
      result.concat(total_dist.round.to_s + " miles")
      
      # Calculate MPH and concat to result if greater than 0
      total_mph = Tracker.calculate_MPH(trips)
      if total_mph > 0
         result.concat(" @ " + total_mph.round.to_s + " mph")
      end
      
      # Add a newline so that each driver gets his own line
      result << "\n"
    end
    
    # return summary
    result  
  end
  
  # Override to_s function to report the trips by driver
  def to_s
    # Allocate the string that will contain driver names and trips
    summary = ""
        
    # Loop through and add to summary 
    @driver_trips.each do |driver, trips|
      summary.concat(driver, ":")
      
      # Loop through each trip for this driver and add the start and end time to report
      trips.each do |trip| 
        summary.concat("\t" + trip.start_time.to_s + "\t" + trip.end_time.to_s + "\t" +  trip.distance.to_s)
      end
      
      # Add a newline so that each driver gets his own line
      summary << "\n"
    end
    
    # return summary
    summary
  end
end
