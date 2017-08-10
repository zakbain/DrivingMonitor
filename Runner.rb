load "Coordinator.rb"

# Initialize tracker and coordinator
@tracker = Tracker.new
@coordinator = Coordinator.new(@tracker)

# Loop through each argument which is a filename
ARGV.each do |filename|
  File.open(filename, "r") do |f|
    # Feed each line to the coordinator to be processed
    f.each_line do |line|
      @coordinator.process_input(line)
    end
  end
end

puts @coordinator.get_tracking_report
