require_relative '../spec_helper'

describe Careerbuilder::Job do
  context '.search' do
    let(:result) { Careerbuilder::Job.search({test: 'data'}) }

    it 'returns an array' do
      expect(result).to be_a(Array)
    end
  end

  context '.find' do
    let(:result) { Careerbuilder::Job.find('anything') }

    it 'returns a job if found' do
      api_call({job_count: 1, jobs: [{test: 'job'}]})
      expect(result).to be_a(Careerbuilder::Job)
    end
    it 'returns a nil if not found' do
      api_call({job_count: 0})
      expect(result).to be_nil
    end
  end
end

def api_call(result)
  allow(Careerbuilder::Utils::Request).to receive(:get).and_return(result)
end
