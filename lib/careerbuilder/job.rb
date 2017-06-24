module Careerbuilder
  class Job
    attr_reader :data

    def data=(d)
      @data = d
    end

    def self.search(params)
      results = Careerbuilder::Utils::Request.get(params)

      results[:jobs].map do |data|
        job = Careerbuilder::Job.new
        job.data = data
        job
      end
    end

    def self.find(id)
      results = Careerbuilder::Utils::Request.get({job_id: id})

      if results[:jobs_count] && results[:jobs_count] > 0
        job = Careerbuilder::Job.new
        job.data = results[:jobs][0]
      else
        job = nil
      end
      job
    end
  end
end
