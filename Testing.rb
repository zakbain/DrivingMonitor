require "test/unit"
load "Runner.rb"

class TC_MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_fail
    assert(false, 'Assertion was false.')
  end
  
  def test_runner
    run = Runner.new
    run = Runner.new()
    run.process_input("Trip Dan 07:15 07:45 17.3")
    run.process_input("Trip Dan 06:12 06:32 21.8")
    run.process_input("Trip Alex 12:01 13:16 42")

    driver_trips = run.root.driver_trips
    
    puts run.root.report
    puts run.root.to_s
    assert(run.root.driver_trips.length == 2, 'Assertion was false.')
  end
end