require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:plane) }

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      expect(airport.land_plane(plane_dbl)).to eq([plane_dbl])
    end

  #   it 'can land multiple planes' do
  #     plane_1
  #     plane_2
  #     plane_3
  #     expect(airport.land_plane(plane_dbl)).to eq([plane_dbl, plane_dbl, plane_dbl, plane_dbl])
  #   end
  end

end
