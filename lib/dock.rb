class Dock

	attr_reader :bikes
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = Array.new
		@broken_bikes = Array.new
		@capacity = capacity
	end

	def release_bike
		raise ("No bikes") if empty?
		if @bikes[-1].working
			return @bikes.pop
		else
			@broken_bikes.push(@bikes.pop)
			release_bike
		end
	end

	def dock_bike(curr_bike, stillWorking = true)
		raise ("No space") if full?
		curr_bike.working = stillWorking
		@bikes << curr_bike
	end


	private

	def full?
		@bikes.length == @capacity
	end

	def empty?
		@bikes.empty?
	end
end