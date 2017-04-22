require_relative '../../spec_helper'

describe Careerbuilder::Utils::Request do
  let(:base_url) { 'http://api.apicast.io/search?' }
  let(:params) { {test: 123} }
  let(:query) { "test=123" }
  let(:api_token) { "#{Careerbuilder.configuration.api_token}" }
  let(:expected_url) { "#{base_url}token=#{api_token}&#{params}" }

  context '#get' do
    it 'merges api_token with query params' do
      expect(HTTParty).to receive(:get)
        .with(expected_url)
      Careerbuilder::Utils::Request.get(params)
    end
  end
end
