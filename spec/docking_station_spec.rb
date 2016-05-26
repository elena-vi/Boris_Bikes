require 'docking_station'

describe DockingStation do

	subject { DockingStation.new }

	it 'responds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end

	# it 'releases a bike' do
	# 	expect(subject.release_bike).is_a? Bike
	# end


	it 'responds to bike method' do
		expect(subject).to respond_to(:working_bikes)
	end

	it 'checks if a bike is docked' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.working_bikes[-1]).to eq bike
	end

	describe "#release_bike releases a bike" do
		it 'releases a bike' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end
		it 'raises an error message if there are no bikes available' do
			expect{subject.release_bike}.to raise_error('No bikes available')
		end

		it 'does not releases when bike is broken' do
			b_bike = Bike.new.broken
			subject.dock(b_bike)
			expect{subject.release_bike}.to raise_error('No workings bikes available')
		end


	end

	describe '#dock(bike) docks a bike' do
		it 'docks a bike' do
			bike = Bike.new
			expect(subject.dock(bike)).to eq [bike]
		end
		it 'raises an error message if we add a bike to a full docking station (20 bikes capacity)' do
			default_size_of_dock = DockingStation::DEFAULT_CAPACITY # In order to retrieve a constant from a class you must ask the class, like this Class::CONSTANT (not an instance of the class, that's why simply doing "subject.DEFAULT_CAPACITY" or "subject::DEFAULT_CAPACITY" did not work)
			default_size_of_dock.times {subject.dock(Bike.new)} # First add 20 bikes, then add another and watch the world burn
			expect{subject.dock(Bike.new)}.to raise_error('Docking station is full')
		end

	end

end
