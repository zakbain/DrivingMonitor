# Stores information about a driver
class Driver
  # Constructor - Creates a driver with the given name
  def initialize(name)
    @name = name
  end
  
  attr_reader :name
end
