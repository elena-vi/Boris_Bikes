require 'bike'

describe Bike do

	it { is_expected.to respond_to :working }

	it 'responds to #new' do
		expect(Bike).to respond_to(:new)
	end

	it 'should be working' do
		expect(Bike.new.working).to be true
	end
end
