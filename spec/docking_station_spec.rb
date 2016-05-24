require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  it 'releases a bike if there is one available' do
    if @bike == nil
      expect {subject.release_bike}.to raise_error("No bikes available")
    else
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end




end
