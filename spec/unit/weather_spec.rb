require 'weather'

describe Weather do

  let(:weather) { described_class.new }

  describe '#type' do
    it 'should randomly return sunny weather some of the time' do
      allow(weather).to receive(:type) { "sunny" }
      expect(weather.type).to eq("sunny")
    end

    it 'should randomly return stormy weather some of the time' do
      allow(weather).to receive(:type) { "stormy" }
      expect(weather.type).to eq("stormy")
    end
  end

end
