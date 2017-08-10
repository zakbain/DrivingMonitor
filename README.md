# DrivingMonitor
A project for keeping track of drivers and the trips they make. With this information, 
calculations can be made for total distance driven by each driver and their average MPH.

## Getting Started
To run this project, open a command line, navigate to the "DrivingMonitor" directory, 
and enter the following command: 
```ruby Runner.rb input.txt 	- where input.txt is the name of the input text file

A report will be written to "output.txt"
The report is formatted such that for every driver, the following is printed:
```{driver_name}: {total_miles} miles @ {avg_mph} MPH

## Solution
First, SimpleTime.rb was created to store time in an HH:MM format. 
	This was used instead of the built in class time as the added complexity of year, 
	month, etc was not needed.
Then, Trip.rb was created to store trip start time, end time, and distance travelled.
Then, Tracker.rb was introduced to store a collection of drivers and their trips. 
	For efficiency purposes, a hash table was used from driver_name to array of trips.
	Tracker.rb exposes functions to add a driver, add a trip, check if a driver is tracked,
		and get the trips for a specific driver
	A few class methods exist to help with calculating total distance and average MPH
	Finally, the report method returns a report of the drivers and trips
Then, Coordinator.rb was created to process command line input
	A Coordinator must be passed in a Tracker when initialized
	The function process_cmd takes in a command string and makes changes to the tracker
Finally, Runner.rb was created for running the entire project and handling file IO
	
## Testing
To run the test suite, call
```ruby Testing.rb
	
## Testing Approach
Each of the classes' methods are tested with "good" and "bad" inputs. 
The report method is tested to ensure that if there are no drivers, the report will be empty
	and if there are drivers, the report will have content. However, it is not tested verbatim 
	as the exact syntax of the report is likely to change over time. 
	
## Concerns
- In my implementation, the "Driver Dan" command is almost unecessary
- A trailing newline is left at the end of "output.txt". 
	I chose not to devote the time to fix this.
