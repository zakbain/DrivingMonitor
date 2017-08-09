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
    # used to store hours and minutes as two digits (e.g.  7:5 => 07:05)
    two_digit_hours = ""
    two_digit_minutes = ""
    
    # if hours are less than 10, append a 0 to make two digits
    if (hours < 10)
      two_digit_hours = "0" + hours.to_s
    else
      two_digit_hours = hours.to_s
    end
    
    # if minutes are less than 10, append a 0 to make two digits
    if (minutes < 10)
      two_digit_minutes = "0" + minutes.to_s
    else
      two_digit_minutes = minutes.to_s
    end
    
    two_digit_hours + ":" + two_digit_minutes
  end
  
  # Make start and end time readable
  attr_reader :hours
  attr_reader :minutes
  
end