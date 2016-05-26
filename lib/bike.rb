class Bike

	attr_accessor :working

	def initialize
		@working = true
	end

	def working?
		@working ? true : false
	end

	def broken
		@working = false
		return self
	end

end


# if bike is working then @working = true
# if bike is borken then @working = false
# Bike.new.working --> true/false