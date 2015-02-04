require 'spec_helper'
describe RawnetAdmin do
  describe '.configure' do
    it 'sets configuration values' do
      something = double(:something)
      something_else = double(:something_else)
      RawnetAdmin.configure do |config|
        config.something = something
      end
      expect(RawnetAdmin.config.something).to eq(something)
    end
  end

  describe '.application' do
    it 'returns an instance of RawnetAdmin::Application' do
      expect(RawnetAdmin.application).to be_a(RawnetAdmin::Application)
    end

    it 'always returns the same instance' do
      application = RawnetAdmin.application
      expect(RawnetAdmin.application).to eq(application)
    end
  end
end
