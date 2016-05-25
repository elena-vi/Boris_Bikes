class Dock

	attr_reader :bikes
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = Array.new
		@capacity = capacity
	end
	
	def release_bike
		raise ("No bikes") if empty?
		return @bikes.pop
	end

	def dock_bike(bike)
		raise ("No space") if full?
		@bikes.push(bike)
	end

	private

	def full?
		@bikes.length == @capacity
	end

	def empty?
		@bikes.empty?
	end
end
