require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:plane) }
  let(:plane_one) { plane_dbl }
  let(:plane_two) { plane_dbl }
  let(:plane_three) { plane_dbl }

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      expect(airport.land_plane(plane_dbl)).to eq([plane_dbl])
    end

    it 'can land multiple planes at the airport' do
      airport.land_plane(plane_one)
      airport.land_plane(plane_two)
      expect(airport.land_plane(plane_three)).to eq([plane_one, plane_two, plane_three])
    end
  end

  describe '#plane_take_off' do
    it 'confiorms removal of the plane from the airport' do
      subject.land_plane(plane_one)
      expect { subject.plane_take_off(plane_one) }.to output("Plane #{plane_one} has taken off from the airport\n").to_stdout
    end
  end

  it 'raises error if trying to take off a plane that isn\'t in the airport' do
    expect { subject.plane_take_off(plane_one) }.to raise_error("That plane is not at the airport")
  end

end
