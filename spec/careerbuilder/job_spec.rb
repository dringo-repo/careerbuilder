require_relative '../spec_helper'

describe Careerbuilder::Job do
  let(:url) { 'example' }
  let(:api_token) do
    "#{Careerbuilder.configuration.api_token}"
  end

  context '.search' do
    it 'succeeds'
    it 'returns an array'
  end

  context '.find' do
    it 'succeeds'
    it 'returns a job if found'
    it 'returns a nil if not found'
  end
end
