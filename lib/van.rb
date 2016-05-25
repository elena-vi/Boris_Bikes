class Van
	
	attr_accessor :collected_broken_bikes, :collected_fixed_bikes

	def collect_broken_bikes(broken_bikes)
		@collected_broken_bikes = broken_bikes
	end
	def deliver_broken_bikes
		temp = @collected_broken_bikes
		@collected_broken_bikes = []
		return temp
	end
	def collect_fixed_bikes(fixed_bikes)
		@collected_fixed_bikes = fixed_bikes
	end
	def deliver_fixed_bikes
		temp = @collected_fixed_bikes
		@collected_fixed_bikes = []
		return temp
	end
end
