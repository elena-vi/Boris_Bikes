require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  it 'does not release a bike if no bikes are available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it 'releases a bike when one is available' do
    initial_bike = Bike.new
    subject.dock_bike(initial_bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end
  
  it 'does not allow docking if docking station is full' do
    initial_bike = Bike.new
    subject.dock_bike(initial_bike)
    bike = Bike.new
    expect {subject.dock_bike(bike)}.to raise_error("No space available") 
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end




end
