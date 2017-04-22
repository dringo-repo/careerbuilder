require_relative '../spec_helper'

describe Careerbuilder::Client do
  let(:url) { 'example' }
  let(:params) { {test: 123} }
  let(:api_token) do
    "#{Careerbuilder.configuration.api_token}"
  end
  
  context '#get' do
    it 'merges api_token with query params'
    it 'passes in query params'
  end
end
