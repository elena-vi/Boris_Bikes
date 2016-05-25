class Dock

	attr_reader :bikes

	def release_bike
		@bikes.empty? ? (raise ("No bikes")) : (return @bikes.pop)
	end

	def dock_bike(bike)
		@bikes.length == 20 ?	(raise ("No space")) :	(@bikes.push(bike))
	end

	def initialize
		@bikes = Array.new
	end
end
