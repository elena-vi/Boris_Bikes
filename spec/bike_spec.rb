require 'bike'

describe Bike do
	it 'responds to method working?' do
		expect(subject).to respond_to (:working?)
	end
	it 'is working' do
		expect(subject).to be_working
	end
	it 'breaks' do
		testyBike = subject
		testyBike.working = false
		expect(testyBike.working?).to eq false
	end
end
