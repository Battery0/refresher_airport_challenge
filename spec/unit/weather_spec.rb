require 'weather'

describe Weather do

  let(:weather) { described_class.new }

  describe '#type' do
    it 'should randomly return sunny weather some of the time' do
      expect(weather.type).to eq("sunny").or eq("stormy")
    end
  end

end
