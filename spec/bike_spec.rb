require 'bike'

describe Bike do

	it { is_expected.to respond_to :working? }

	it 'responds to #new' do
		expect(Bike).to respond_to(:new)
	end

end
