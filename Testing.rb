require "test/unit"
load "Runner.rb"

class TC_MyTest < Test::Unit::TestCase
  # Performed before every test
  def setup
    # Initialize somehours for testing
    @ZERO_O_CLOCK = 0
    @FIVE_O_CLOCK = 5
    @TEN_O_CLOCK = 10
    @TWENTY_TWO_O_CLOCK = 22
    @TWENTY_ONE_O_CLOCK = 21
    
    # Initialize some minutes for testing
    @ZERO_MINUTES = 0
    @FIFTEEN_MINUTES = 15
    @THIRTY_MINUTES = 30
    @FOURTY_FIVE_MINUTES = 45
  end

  # SimpleTime Tests
  def test_simple_time_basic_constructor
    # Locally assign hours and minutes 
    hours = 10
    minutes = 30
    
    # Create a new time and check that its hours and minutes are correctly assigned
    ten_thirty = SimpleTime.new(hours, minutes)
    assert(ten_thirty.hours == @TEN_O_CLOCK, "Hours attribute was not read correctly")
    assert(ten_thirty.minutes == @THIRTY_MINUTES, "Minute attribute was not read correctly")
  end
  
  # Trip Tests
  def test_trip_basic_constructor
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

  # 

  def test_runner
    run = Runner.new
    run.process_input("Trip Dan 07:15 07:45 17.3")
    run.process_input("Trip Dan 06:12 06:32 21.8")
    run.process_input("Trip Alex 12:01 13:16 42")

    driver_trips = run.root.driver_trips
    
    puts run.root.report
    puts run.root.to_s
    assert(run.root.driver_trips.length == 2, 'Assertion was false.')
  end
end