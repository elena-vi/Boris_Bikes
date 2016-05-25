require './lib/dock.rb'
require './lib/bike.rb'

describe Dock do

	let(:bike) {double :bike, :working= => true, :working => true}

	before(:each) do
		@dock = Dock.new
		@dock.dock_bike(bike)
		# allow(bike).to receive(:working=).and_return(true)
		# allow(bike).to receive(:working).and_return(true)
	end

	it 'checks that user can set capacity' do  
		dock2 = Dock.new(30)
		30.times {dock2.dock_bike(bike)}
		expect(dock2.bikes.length).to eq 30
	end

	it 'respond to release_bike' do
		expect(@dock).to respond_to(:release_bike)
	end

	it 'returns only working bikes' do
		@dock.dock_bike(bike, false)
		testBike = @dock.release_bike
		expect(testBike.working).to eq true
	end

	it 'check if docked bike is broken or not' do 
		allow(bike).to receive(:working).and_return(false)
		@dock.dock_bike(bike, false)
		expect(@dock.bikes[-1].working).to be false
	end

	it '#docked_bike returns instance variable bikes' do
		expect(@dock.bikes.class).to eq Array
	end

	it '#release_bike raise an error if dock is empty' do
		expect{2.times{@dock.release_bike}}.to raise_error
	end

	it 'tries to dock another bike' do
		expect{(Dock::DEFAULT_CAPACITY + 1).times {@dock.dock_bike(bike)}}.to raise_error
	end


end
