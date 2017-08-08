load 'Tracker.rb'

#Create a trip
dan = Driver.new("Daniel")
zak = Driver.new("Zakariya")
first_trip = Trip.new(2, 5)
second_trip = Trip.new(400, 600)


# Create a driver and add the trip we created
root = Tracker.new()
root.record_new_trip(dan, first_trip)
root.record_new_trip(zak, second_trip)

driver_trips = root.driver_trips

driver_trips.each do |driver, trips|
  puts driver.name
  
  trips.each do |trip| 
    puts "\t" + trip.start_time.to_s + "\t" + trip.end_time.to_s
  end
end