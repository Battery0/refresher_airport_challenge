require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:plane) }

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      expect(airport.land_plane(plane_dbl)).to eq([plane_dbl])
    end

    it 'can land multiple planes at the airport' do
      plane_one = plane_dbl
      plane_two = plane_dbl
      plane_three = plane_dbl
      airport.land_plane(plane_one)
      airport.land_plane(plane_two)
      expect(airport.land_plane(plane_three)).to eq([plane_one, plane_two, plane_three])
    end
  end

end
