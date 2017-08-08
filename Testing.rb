load 'Tracker.rb'

#Create a few arbitrary drivers and trips
dan = Driver.new("Daniel")
zak = Driver.new("Zakariya")

# Create random trip times

first_trip = Trip.new(Time.local(2008, 7, 8, 9, 10)  , Time.local(2008, 7, 8, 9, 10)  , 200)
dans_first_trip = Trip.new(2, 5, 200)
second_trip = Trip.new(400, 600, 3000)


# Record the drivers and trips in the tracker
root = Tracker.new()
root.record_new_trip(dan, first_trip)
root.record_new_trip(zak, second_trip)

driver_trips = root.driver_trips

puts root