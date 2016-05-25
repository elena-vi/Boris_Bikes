class Garage
	def fix_bikes(broken_bikes)
		broken_bikes.each {|b| b.working = true}
	end
end