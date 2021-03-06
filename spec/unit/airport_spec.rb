require 'airport'

describe Airport do

  let(:weather_dbl) { double(:weather_dbl) }
  let(:airport) { described_class.new(weather_dbl) }
  let(:airport_variable_capacity) { described_class.new(weather_dbl, capacity: 4) }
  let(:plane_dbl) { double(:plane) }
  let(:plane_one) { plane_dbl }
  let(:plane_two) { plane_dbl }
  let(:plane_three) { plane_dbl }
  let(:plane_four) { plane_dbl }
  let(:plane_five) { plane_dbl }

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      expect(airport.land_plane(plane_one)).to eq([plane_one])
    end

    it 'can land multiple planes at the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport.land_plane(plane_one)
      airport.land_plane(plane_two)
      expect(airport.land_plane(plane_three)).to eq([plane_one, plane_two, plane_three])
    end

    it 'raises error if trying to land a plane that has already landed' do
      allow(plane_dbl).to receive(:flying?).and_return(false)
      expect { airport.land_plane(plane_one) }.to raise_error("This plane has already landed")
    end

    it 'raises error when trying to land a plane if the airport is full at default capacity' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport.land_plane(plane_one)
      airport.land_plane(plane_two)
      airport.land_plane(plane_three)
      expect { airport.land_plane(plane_four) }.to raise_error("The airport is currently full")
    end

    it 'raises error when trying to land a plane if the airport is at a user set capacity' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport_variable_capacity.land_plane(plane_one)
      airport_variable_capacity.land_plane(plane_two)
      airport_variable_capacity.land_plane(plane_three)
      airport_variable_capacity.land_plane(plane_four)
      expect { airport_variable_capacity.land_plane(plane_five) }.to raise_error("The airport is currently full")
    end

    it 'prevents landing if the weather is stormy' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(plane_dbl).to receive(:taken_off).and_return(true)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport.land_plane(plane_one)
      allow(weather_dbl).to receive(:type).and_return("stormy")
      expect { airport.land_plane(plane_one) }.to raise_error("The weather is currently stormy and planes can't take off")
    end

  end

  describe '#plane_take_off' do
    it 'confirms removal of the plane from the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(plane_dbl).to receive(:taken_off).and_return(true)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport.land_plane(plane_one)
      expect { airport.plane_take_off(plane_one) }.to output("Plane #{plane_one} has taken off from the airport\n").to_stdout
    end

    it 'raises error if trying to take off a plane that isn\'t in the airport' do
      expect { airport.plane_take_off(plane_one) }.to raise_error("That plane is not at the airport")
    end

    it 'prevents plane take off if the weather is stormy' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(plane_dbl).to receive(:taken_off).and_return(true)
      allow(weather_dbl).to receive(:type).and_return("sunny")
      airport.land_plane(plane_one)
      allow(weather_dbl).to receive(:type).and_return("stormy")
      expect { airport.plane_take_off(plane_one) }.to raise_error("The weather is currently stormy and planes can't take off")
    end

  end

  describe '#add_new_plane' do
    it 'adds a newly created plane to the airport hangar' do
      expect(airport.add_new_plane(plane_one)).to eq([plane_one])
    end

    it 'raises an error if trying to add a new plane to the hangar that is already there' do
      airport.add_new_plane(plane_one)
      expect { airport.add_new_plane(plane_one) }.to raise_error("The plane #{plane_one} is already in the hangar")
    end

  end

end
