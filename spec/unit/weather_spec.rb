require 'weather'

describe Weather do

  let(:weather) { described_class.new }

  describe '#type' do
    it 'should return either "sunny" or "stormy"' do
      expect(weather.type).to eq("sunny").or eq("stormy")
    end
  end

end
