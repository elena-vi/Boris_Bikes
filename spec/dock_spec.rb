require './lib/dock.rb'
require './lib/bike.rb'


describe Dock do

	before(:each) do
		@dock = Dock.new
	end

	# it 'expects #new to have an argument' do
	# 	expect{Dock.new(Bike.new)}.to_not raise_error
	# end

	it 'checks that user can set capacity' do
		dock2 = Dock.new(30)
		30.times {dock2.dock_bike(Bike.new)}
		expect(dock2.bikes.length).to eq 30
	end

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
		expect{@dock.release_bike}.to raise_error
	end

	it 'tries to dock another bike' do
		expect{(Dock::DEFAULT_CAPACITY + 1).times {@dock.dock_bike(Bike.new)}}.to raise_error
	end

end
