require "test/unit"
load "Runner.rb"

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
    
    # A few easy to use trips. Short is from 05:15 - 05:30 and 5 miles
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@FIVE_O_CLOCK, @THIRTY_MINUTES)
    distance = 5
    @SHORT_TRIP = Trip.new(start_time, end_time, distance)
    
    # Medium trip is from 05:15 to 10:30 and 200 miles
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    distance = 200
    @MEDIUM_TRIP = Trip.new(start_time, end_time, distance)
    
    # Max trip is from 0:00 to 23:59 and 1500 miles
    start_time = SimpleTime.new(@ZERO_O_CLOCK, @ZERO_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @FIFTY_NINE_MINUTES)
    distance = 1500
    @MAX_TRIP = Trip.new(start_time, end_time, distance)
  
    @tracker = Tracker.new
  
  end

  # SimpleTime Tests
  def test_construct_simple_time
    # Locally assign hours and minutes for assertions
    hours = 10
    minutes = 30
    
    # Create a new time and check that its hours and minutes are correctly assigned
    ten_thirty = SimpleTime.new(hours, minutes)
    assert(ten_thirty.hours == hours, "Hours attribute was not read correctly")
    assert(ten_thirty.minutes == minutes, "Minute attribute was not read correctly")
  end
  
  # Trip Tests
  def test_construct_trip
    # Create start and end time
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    distance = 20
    
    # Create a new trip and check that the start time hours and minutes are set to the expected values
    quick_trip = Trip.new(start_time, end_time, distance)
    assert(quick_trip.distance == distance, "Distance attribute was not read correctly")
    assert(quick_trip.start_time.hours == @FIVE_O_CLOCK, "Start time hours attribute was not read correctly")
    assert(quick_trip.start_time.minutes == @FIFTEEN_MINUTES, "Start time minutes attribute was not read correctly")
    assert(quick_trip.end_time.hours == @TEN_O_CLOCK, "End time hours attribute was not read correctly")
    assert(quick_trip.end_time.minutes == @THIRTY_MINUTES, "End time minutes attribute was not read correctly")
  end

  # Test that one can add a driver
  def test_add_new_driver
    emma = "Emma";
    
    # Add the driver and check that she's tracked
    @tracker.add_new_driver(@EMMA_DRIVER)
    
    assert(@tracker.is_driver_tracked(emma), "")
  end

  # Test that adding an existing driver does not remove previous trip data for that driver
  def test_add_existing_driver
    emma = "Emma"
    emma_clone = "Emma" 
    
    @tracker.add_new_driver(@EMMA_DRIVER)
  
  end
  
  # Test that adding a driver with no name is not allowed
  def test_add_empty_driver
    
  end
  
  def test_add_one_trip_to_driver
    
  end
  
  def test_add_trips_to_driver
    
  end
  
  def test_add_duplicate_trip_to_driver
    
  end

  def test_run_shit
    run = Runner.new
    run.process_input("Trip Dan 07:15 07:45 17.3")
    run.process_input("Trip Dan 06:12 06:32 21.8")
    run.process_input("Trip Alex 12:01 13:16 42")

    puts run.root.report
    puts run.root.to_s
  end
end