class Dock

	attr_reader :bikes

	def release_bike
		raise ("No bikes") if empty?
		return @bikes.pop
	end

	def dock_bike(bike)
		raise ("No space") if full?
		@bikes.push(bike)
	end

	def initialize
		@bikes = Array.new
	end
	
	private
	def full?
		@bikes.length == 20
	end

	def empty?
		@bikes.empty?
	end
end
