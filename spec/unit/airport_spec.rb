require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:plane) }
  let(:plane_one) { plane_dbl }
  let(:plane_two) { plane_dbl }
  let(:plane_three) { plane_dbl }

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      expect(airport.land_plane(plane_one)).to eq([plane_one])
    end

    it 'can land multiple planes at the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      airport.land_plane(plane_one)
      airport.land_plane(plane_two)
      expect(airport.land_plane(plane_three)).to eq([plane_one, plane_two, plane_three])
    end

    it 'raises error if trying to land a plane that has already landed' do
      allow(plane_dbl).to receive(:flying?).and_return(false)
      expect { airport.land_plane(plane_one) }.to raise_error("This plane has already landed")
    end

  end

  describe '#plane_take_off' do
    it 'confirms removal of the plane from the airport' do
      allow(plane_dbl).to receive(:flying?).and_return(true)
      allow(plane_dbl).to receive(:landed).and_return(false)
      allow(plane_dbl).to receive(:taken_off).and_return(true)
      airport.land_plane(plane_one)
      expect { airport.plane_take_off(plane_one) }.to output("Plane #{plane_one} has taken off from the airport\n").to_stdout
    end

    it 'raises error if trying to take off a plane that isn\'t in the airport' do
      expect { airport.plane_take_off(plane_one) }.to raise_error("That plane is not at the airport")
    end
  end

  describe '#add_new_plane' do
    it 'adds a newly created plane to the airport hanger' do
      expect(airport.add_new_plane(plane_one)).to eq([plane_one])
    end
  end

end
