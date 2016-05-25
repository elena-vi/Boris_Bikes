require './lib/dock.rb'
require './lib/bike.rb'


describe Dock do

	before(:each) do
		@dock = Dock.new
	end

	# it 'expects #new to have an argument' do
	# 	expect{Dock.new(Bike.new)}.to_not raise_error
	# end

	it 'respond to release_bike' do
		expect(@dock).to respond_to(:release_bike)
	end

	it 'returns a bike and checks if it works' do
		@dock.dock_bike(Bike.new)
		testBike = @dock.release_bike
		expect(testBike.class).to eq Bike
		expect(testBike.working?).to eq true
	end

	it '#docked_bike returns instance variable @docked_bike' do
		expect(@dock.bikes.class).to eq Array
	end

	it '#release_bike raise an error if dock is empty' do
		expect{2.times{@dock.release_bike}}.to raise_error
	end

	it 'tries to dock another bike' do
		expect{21.times {@dock.dock_bike(Bike.new)}}.to raise_error
	end

end
