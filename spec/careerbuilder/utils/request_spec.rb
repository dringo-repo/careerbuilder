require_relative '../../spec_helper'

describe Careerbuilder::Utils::Request do
  let(:base_url) { 'http://api.appcast.io/search?' }
  let(:params) { {test: 123} }
  let(:query) { "test=123&" }
  let(:api_token) { "#{Careerbuilder.configuration.api_token}" }
  let(:expected_url) { "#{base_url}token=#{api_token}&#{query}" }
  let(:response) { double(body: '{"test": 123}') }

  context '#get' do
    it 'merges api_token with query params' do
      expect(HTTParty).to receive(:get).with(expected_url).and_return(response)
      allow(JSON).to receive(:parse).with(response.body, {symbolize_names: true})

      Careerbuilder::Utils::Request.get(params)
    end

    it 'returns parsed data' do
      allow(HTTParty).to receive(:get).with(expected_url).and_return(response)

      expect(Careerbuilder::Utils::Request.get(params)).to eq(params)
    end
  end
end
