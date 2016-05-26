require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :working_bikes

  def initialize(init_spaces = DEFAULT_CAPACITY)
    @no_of_spaces = init_spaces
    @working_bikes = Array.new
    @broken_bikes = Array.new
  end

  def release_bike
    raise 'No workings bikes available' if empty? && !@broken_bikes.empty?
    raise "No bikes available" if empty?
    @working_bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if full?

    if bike.working?
      @working_bikes << bike
    else
      @broken_bikes << bike
    end

  end

  private

  def full?
    @working_bikes.length + @broken_bikes.length >= @no_of_spaces # Comparing two numbers already retruns true/fase by ruby magijs, no need for returns
  end

  def empty?
    @working_bikes.empty?
  end

end




# [1] pry(main)> require './lib/docking_station'
# => true magicss!!!
# [2] pry(main)> docking_station = DockingStation.new
# => #<DockingStation:0x007fa433224c58>
# [3] pry(main)> bike = Bike.new
# => #<Bike:0x007fa433165268>
# [4] pry(main)> docking_station.dock(bike)
# => RuntimeError: Docking station full magicss!!!
# [5] pry(main)> 21.times {docking_station.release_bike}
# RuntimeError: No bikes available
# from /Users/abdullamahmood/Projects/boris-bikes/lib/docking_station.rb:8:in `release_bike' magicss!!!