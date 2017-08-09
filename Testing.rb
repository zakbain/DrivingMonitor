require "test/unit"
load "Runner.rb"

class TC_MyTest < Test::Unit::TestCase
  # Performed before every test
  def setup
    # hour constants for testing
    @ZERO_O_CLOCK = 0
    @FIVE_O_CLOCK = 5
    @TEN_O_CLOCK = 10
    @TWENTY_TWO_O_CLOCK = 22
    @TWENTY_ONE_O_CLOCK = 21
    
    # minute constants for testing
    @ZERO_MINUTES = 0
    @FIFTEEN_MINUTES = 15
    @THIRTY_MINUTES = 30
    @FOURTY_FIVE_MINUTES = 45
    
    # Initialize 
    @EMMA_DRIVER = "Emma"
    @BOB_DRIVER = "Bob"
    @DAN_DRIVER = "Dan"
    @TESSA_DRIVER = "Tessa"
    
    @tracker = Tracker.new
  end

  # SimpleTime Tests
  def test_construct_simple_time
    # Locally assign hours and minutes 
    hours = 10
    minutes = 30
    
    # Create a new time and check that its hours and minutes are correctly assigned
    ten_thirty = SimpleTime.new(hours, minutes)
    assert(ten_thirty.hours == @TEN_O_CLOCK, "Hours attribute was not read correctly")
    assert(ten_thirty.minutes == @THIRTY_MINUTES, "Minute attribute was not read correctly")
  end
  
  # Trip Tests
  def test_construct_trip
    # Create start and end time
    start_time = SimpleTime.new(@FIVE_O_CLOCK, @FIFTEEN_MINUTES)
    end_time = SimpleTime.new(@TEN_O_CLOCK, @THIRTY_MINUTES)
    distance = 20
    
    # Create a new trip and check that the start time hours and minutes are set to the expected values
    quick_trip = Trip.new(start_time, end_time, distance)
    assert(quick_trip.distance == 20, "Distance attribute was not read correctly")
    assert(quick_trip.start_time.hours == @FIVE_O_CLOCK, "Start time hours attribute was not read correctly")
    assert(quick_trip.start_time.minutes == @FIFTEEN_MINUTES, "Start time minutes attribute was not read correctly")
    assert(quick_trip.end_time.hours == @TEN_O_CLOCK, "End time hours attribute was not read correctly")
    assert(quick_trip.end_time.minutes == @THIRTY_MINUTES, "End time minutes attribute was not read correctly")
  end

  # Test that one can add a driver
  def test_add_new_driver
    emma = "Emma";
    
    @tracker.add_new_driver(@EMMA_DRIVER)
    assert(@tracker.is_driver_tracked(emma), "")
  end

  # Test that adding an existing driver does not remove previous trip data for that driver
  def test_add_existing_driver
    
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