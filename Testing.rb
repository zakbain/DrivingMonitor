require "test/unit"
load "Coordinator.rb"
load "Tracker.rb"

class TC_MyTest < Test::Unit::TestCase
  # Performed before every test
  def setup
    # hour constants for testing
    @ZERO_O_CLOCK = 0
    @FIVE_O_CLOCK = 5
    @TEN_O_CLOCK = 10
    @TWENTY_THREE_O_CLOCK = 23
    @TWENTY_ONE_O_CLOCK = 21
    
    # minute constants for testing
    @ZERO_MINUTES = 0
    @FIFTEEN_MINUTES = 15
    @THIRTY_MINUTES = 30
    @FOURTY_FIVE_MINUTES = 45
    @FIFTY_NINE_MINUTES = 59
    
    # Initialize 
    @EMMA_DRIVER = "Emma"
    @BOB_DRIVER = "Bob"
    @DAN_DRIVER = "Dan"
    @TESSA_DRIVER = "Tessa"
    @EMPTY_DRIVER = ""
    
    # A few easy to use trips. Short is from 05:15 - 05:30 and 5 miles
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@FIVE_O_CLOCK, @THIRTY_MINUTES)
    @SHORT_DISTANCE = 5
    @SHORT_TRIP = Trip.new(start_time, end_time, @SHORT_DISTANCE)
    
    # Medium trip is from 05:15 to 10:30 and 200 miles
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    @MEDIUM_DISTANCE = 200
    @MEDIUM_TRIP = Trip.new(start_time, end_time, @MEDIUM_DISTANCE)
    
    # Max trip is from 0:00 to 23:59 and 1500 miles
    start_time = SimpleTime.new(@ZERO_O_CLOCK, @ZERO_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @FIFTY_NINE_MINUTES)
    @LONG_DISTANCE = 1500
    @MAX_TRIP = Trip.new(start_time, end_time, @LONG_DISTANCE)
  
    @test_tracker = Tracker.new
    @test_coordinator = Coordinator.new(@test_tracker)
  
  end

  # SimpleTime Tests
  def test_construct_simple_time
    # Create a new time and check that its hours and minutes are correctly assigned
    ten_thirty = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    assert(ten_thirty.hours == @TEN_O_CLOCK, "Hours attribute was not read correctly")
    assert(ten_thirty.minutes == @THIRTY_MINUTES, "Minute attribute was not read correctly")
  end
  
  # Trip Tests
  def test_construct_trip
    # Create start and end time
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    
    # Create a new trip and check that the start time hours and minutes are set to the expected values
    quick_trip = Trip.new(start_time, end_time, @SHORT_DISTANCE)
    assert(quick_trip.distance == @SHORT_DISTANCE, "Distance attribute was not read correctly")
    assert(quick_trip.start_time.hours == @FIVE_O_CLOCK, "Start time hours attribute was not read correctly")
    assert(quick_trip.start_time.minutes == @FIFTEEN_MINUTES, "Start time minutes attribute was not read correctly")
    assert(quick_trip.end_time.hours == @TEN_O_CLOCK, "End time hours attribute was not read correctly")
    assert(quick_trip.end_time.minutes == @THIRTY_MINUTES, "End time minutes attribute was not read correctly")
  end

  # Test that one can add a driver
  def test_add_new_driver
    # Add the driver and check that she's tracked
    @test_tracker.add_new_driver(@EMMA_DRIVER)
    
    assert(@test_tracker.is_driver_tracked(@EMMA_DRIVER), "Driver named " + @EMMA_DRIVER + "is not being tracked.")
  end

  # Test that adding an existing driver does not remove previous trip data for that driver
  def test_add_existing_driver
    emma_clone = "Emma" 
    
    # Create emma with a medium trip
    @test_tracker.add_new_driver(@EMMA_DRIVER)
    @test_tracker.record_new_trip(@EMMA_DRIVER, @MEDIUM_TRIP)
    
    # Try to add new tracker
    @test_tracker.add_new_driver(emma_clone)
    
    assert(@test_tracker.is_driver_tracked(@EMMA_DRIVER), "Driver named " + @EMMA_DRIVER + " is not being tracked.")
    assert(@test_tracker.get_trips(@EMMA_DRIVER).length == 1, "Driver named " + @EMMA_DRIVER + " did not have the correct number of trips")
  end
  
  # Test that adding a driver with no name is not allowed
  def test_add_empty_driver
    # Try to add the empty driver and check that it wasn't added
    @test_tracker.add_new_driver(@EMPTY_DRIVER)
    assert(!@test_tracker.is_driver_tracked(@EMPTY_DRIVER), "Driver with empty name was added to tracker")
    assert(!@test_tracker.get_trips(@EMPTY_DRIVER), "Driver with empty name has no trips")
  end
  
  # Test that you can add a single trip to the driver
  def test_add_one_trip_to_driver
    # Add bob with a medium trip
    @test_tracker.add_new_driver(@BOB_DRIVER)
    @test_tracker.record_new_trip(@BOB_DRIVER, @MEDIUM_TRIP)
        
    # Make sure the trip was properly added
    assert(@test_tracker.is_driver_tracked(@BOB_DRIVER), "Driver named " + @BOB_DRIVER + " is not being tracked.")
    assert(@test_tracker.get_trips(@BOB_DRIVER).length == 1, "Driver named " + @BOB_DRIVER + " did not have the correct number of trips")
    
    # Check that the trip was added correctly
    first_trip = @test_tracker.get_trips(@BOB_DRIVER)[0]
    
    assert(first_trip == @MEDIUM_TRIP, "First trip was not the expected value")
  end
  
  # Test that you can add many trips to a single driver
  def test_add_trips_to_driver
    # Add bob with a few trips
    @test_tracker.add_new_driver(@BOB_DRIVER)
    @test_tracker.record_new_trip(@BOB_DRIVER, @SHORT_TRIP)
    @test_tracker.record_new_trip(@BOB_DRIVER, @MEDIUM_TRIP)
    @test_tracker.record_new_trip(@BOB_DRIVER, @MAX_TRIP)
        
    # Make sure the trip was properly added
    assert(@test_tracker.is_driver_tracked(@BOB_DRIVER), "Driver named " + @BOB_DRIVER + " is not being tracked.")
    assert(@test_tracker.get_trips(@BOB_DRIVER).length == 3, "Driver named " + @BOB_DRIVER + " did not have the correct number of trips")
    
    # Check that the first trip was added correctly
    first_trip = @test_tracker.get_trips(@BOB_DRIVER)[0]
    assert(first_trip == @SHORT_TRIP, "First trip was not the expected value")
    
        
    # Check that the second trip was added correctly
    second_trip = @test_tracker.get_trips(@BOB_DRIVER)[1]
    assert(second_trip == @MEDIUM_TRIP, "Second trip was not the expected value")
    
    # Check that the third trip was added correctly
    third_trip = @test_tracker.get_trips(@BOB_DRIVER)[2]
    assert(third_trip == @MAX_TRIP, "Third trip was not the expected value")
  end
  
  # Test that you can add duplicate trips to a driver
  def test_add_duplicate_trip_to_driver
    # Add bob with a few 
    @test_tracker.add_new_driver(@BOB_DRIVER)
    @test_tracker.record_new_trip(@BOB_DRIVER, @SHORT_TRIP)
    @test_tracker.record_new_trip(@BOB_DRIVER, @SHORT_TRIP)
    
    # Check that the first trip was added correctly
    first_trip = @test_tracker.get_trips(@BOB_DRIVER)[0]
    assert(first_trip == @SHORT_TRIP, "First trip was not the expected value")
        
    # Check that the second trip was added correctly
    second_trip = @test_tracker.get_trips(@BOB_DRIVER)[1]
    assert(second_trip == @SHORT_TRIP, "Second trip was not the expected value")
  end
  
  # Test that you can add driver through command line
  def test_cmd_add_driver
    @test_coordinator.process_cmd("Driver Emma")
    
    assert(@test_coordinator.tracker.is_driver_tracked(@EMMA_DRIVER), "Driver was not added correctly to tracker")
  end
  
  # Test that you can't call driver with no name
  def test_cmd_add_no_driver
    @test_coordinator.process_cmd("Driver ")
    assert(!@test_coordinator.tracker.is_driver_tracked(@EMPTY_DRIVER), "Driver with no name should not be added to tracker")
  end
  
  # Test that you can add many drivers through the command line
  def test_cmd_add_many_drivers
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Driver Tessa")
    
    assert(@test_coordinator.tracker.is_driver_tracked(@EMMA_DRIVER), "Driver was not added to tracker")
    assert(@test_coordinator.tracker.is_driver_tracked(@TESSA_DRIVER), "Driver was not added to tracker")
  end
  
  # Test that you can add a trip to a driver
  def test_cmd_add_one_trip
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Trip Emma 05:15 05:30 5")
    
    # Check that the first trip was added correctly
    first_trip = @test_coordinator.tracker.get_trips(@EMMA_DRIVER)[0]
    assert(first_trip == @SHORT_TRIP, "First trip was not the expected value")
  end  
  
  # Test that the coordinator can handle an empty trip
  def test_cmd_add_empty_trip
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Trip ")
   
    assert(@test_coordinator.tracker.get_trips(@EMMA_DRIVER), "No trips should be added")
  end
  
  # Test that the coordinator can handle a bad trip
  def test_cmd_add_bad_trip
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Trip good luck trying this")
    
    assert(@test_coordinator.tracker.get_trips(@EMMA_DRIVER), "No trips should be added")
  end
  
  # Test that we can add many trips to a single driver
  def test_cmd_add_many_trips
    # Add Emma with many trips
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Trip Emma 05:15 05:30 5")
    @test_coordinator.process_cmd("Trip Emma 05:15 10:30 200")
    
    # Check that the first trip was added correctly
    first_trip = @test_coordinator.tracker.get_trips(@EMMA_DRIVER)[0]
    assert(first_trip == @SHORT_TRIP, "First trip was not the expected value")
    
    second_trip = @test_coordinator.tracker.get_trips(@EMMA_DRIVER)[1]
    assert(second_trip == @MEDIUM_TRIP, "Second trip was not the expected value")
  end
  
  # Test that the report is printed correctly
  def test_print_report_no_drivers
    assert(@test_coordinator.get_tracking_report.empty?, "Report should have been empty")
  end
  
  # Test that the coordinator actually prints something if there are drivers
  def test_print_report_with_drivers
    # Add Emma with many trips
    @test_coordinator.process_cmd("Driver Emma")
    @test_coordinator.process_cmd("Trip Emma 05:15 05:30 5")
    @test_coordinator.process_cmd("Trip Emma 05:15 10:30 200")
    
    assert(!@test_coordinator.get_tracking_report.empty?, "Report should not have been empty")
  end
  
end