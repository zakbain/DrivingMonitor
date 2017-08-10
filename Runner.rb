load "Coordinator.rb"

# Initialize tracker and coordinator
@tracker = Tracker.new
@coordinator = Coordinator.new(@tracker)
@output_filename = "output.txt"

# Loop through each argument which is a filename
ARGV.each do |filename|
  File.open(filename, "r") do |f|
    # Feed each line to the coordinator to be processed
    f.each_line do |line|
      @coordinator.process_cmd(line)
    end
  end
end

# Open file 
File.open(@output_filename, 'w') { 
  # Print the report to file
  |file| file.write(@coordinator.get_tracking_report) 
}

puts "Successfully printed to " + @output_filename
