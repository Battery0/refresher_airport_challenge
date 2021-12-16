require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane_dbl) { double(:Plane) }

  describe '#new_plane' do
    it 'creates a new plane object' do
      # plane_class_dbl = class_double("Plane")
      # allow(plane_class_dbl).to receive(:new).and_return(plane_dbl)
      # expect(airport.new_plane(plane_dbl)).to be_an_instance_of(plane_class_dbl)
      # need to check the above and see if its possible to mock/stub using "to be_an_instance_of" rspec syntax
      expect(airport.new_plane(plane_dbl)).to eq(plane_dbl)
    end
  end

  describe '#land_plane' do
    it 'tells a plane to land at the airport' do
      expect(airport.land_plane(plane_dbl)).to eq([plane_dbl])
    end
  end

end
