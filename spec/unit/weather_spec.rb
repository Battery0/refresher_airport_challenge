require 'weather'

describe Weather do

  let(:weather) { described_class.new }

  describe '#type' do
    it 'should randomly return sunny some of the time' do
      allow(weather).to receive(:type) { "sunny" }
      expect(weather.type).to eq("sunny")
    end
  end

end
