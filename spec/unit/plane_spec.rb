require 'plane'

describe Plane do

  let(:plane) { described_class.new }

  describe '#landed' do
    it 'returns false if the plane is flying' do
      expect(plane.landed).to eq(false)
    end
  end

  describe '#taken_off' do
    it 'returns true if the plane has taken off' do
      expect(plane.taken_off).to eq(true)
    end
  end

end
