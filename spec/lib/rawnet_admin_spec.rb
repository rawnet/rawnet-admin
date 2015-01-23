require 'spec_helper'
describe RawnetAdmin do
  describe '.configure' do
    it 'sets configuration values' do
      something = double(:something)
      something_else = double(:something_else)
      RawnetAdmin.configure do |config|
        config.something = something
        config.something_else = something_else
      end
      expect(RawnetAdmin.config.something).to eq(something)
      expect(RawnetAdmin.config.something_else).to eq(something_else)
    end
  end
end
