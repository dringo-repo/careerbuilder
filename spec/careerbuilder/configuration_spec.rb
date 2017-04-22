require_relative '../spec_helper'

describe Careerbuilder::Configuration do
  before do
    Careerbuilder.configure do |config|
      config.api_token = ENV['CB_TOKEN']
    end
  end

  context 'with configuration block' do
    it 'returns the correct api_token' do
      expect(Careerbuilder.configuration.api_token).to eq(ENV['CB_TOKEN'])
    end
  end

  context 'without configuration block' do
    before do
      Careerbuilder.reset
    end

    it 'raises a configuration error for access_key' do
      expect { Careerbuilder.configuration.api_token }.to raise_error(Careerbuilder::Errors::Configuration)
    end
  end

  context '#reset' do
    it 'resets configured values' do
      expect(Careerbuilder.configuration.api_token).to eq(ENV['CB_TOKEN'])
      Careerbuilder.reset
      expect { Careerbuilder.configuration.api_token }.to raise_error(Careerbuilder::Errors::Configuration)
    end
  end
end
