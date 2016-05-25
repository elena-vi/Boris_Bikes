require 'van'

describe Van do

	before(:each) do
		@van = Van.new
		@bikes_array = []
		2.times{@bikes_array << double(:bike, :working= => false, :working => false)}
	end

	it 'collects broken bikes' do
		expect(@van.collect_broken_bikes(@bikes_array)).to eq @bikes_array
		expect(@van.collect_broken_bikes(@bikes_array)[0].working).to eq false
	end

	it 'deliver broken bikes' do
		@van.collect_broken_bikes(@bikes_array)
		expect(@van.deliver_broken_bikes).to eq @bikes_array
	end
	it 'collects fixed bikes' do
		expect(@van.collect_fixed_bikes(@bikes_array)).to eq @bikes_array
		# expect(@van.collect_broken_bikes(@bikes_array)[0].working).to eq true
	end

	it 'deliver fixed bikes' do
		@van.collect_fixed_bikes(@bikes_array)
		expect(@van.deliver_fixed_bikes).to eq @bikes_array
	end
end