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

  # this describe block is testing state - is it possible to test behaviour instead? I need to come back to this?
  describe '#flying?' do
    it 'returns false if the plane has landed' do
      plane.landed
      expect(plane.flying?).to eq(false)
    end

    it 'returns true if the plane has not landed' do
      plane.taken_off
      expect(plane.flying?).to eq(true)
    end
  end

end
