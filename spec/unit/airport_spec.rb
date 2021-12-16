require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:Plane) }

  # describe '#land_plane' do
  #   it 'tells a plane to land at the airport' do
  #     expect(airport.land_plane(plane_1)).to eq([plane_1])
  #   end

  #   it 'can land multiple planes' do
  #     plane_1
  #     plane_2
  #     plane_3
  #     expect(airport.land_plane(plane_dbl)).to eq([plane_dbl, plane_dbl, plane_dbl, plane_dbl])
  #   end
  # end

end
