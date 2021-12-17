require 'plane'

describe Plane do

  let(:plane) { described_class.new }

  describe '#landed' do
    it 'returns false if the plane is flying' do
      expect(subject.landed).to eq(false)
    end
  end

end
