=begin
  Represents a time in a 24-hour day. 
  Unlike the native Time class, this does not store year, month, day, etc.
=end
class SimpleTime
  
  # Constructor - creates this SimpleTime with the specified hours and minutes
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end
  
  # Print time as "HH:MM"
  def to_s
    hours.to_s + ":" + minutes.to_s
  end
  
  # Make start and end time readable
  attr_reader :hours
  attr_reader :minutes
  
end