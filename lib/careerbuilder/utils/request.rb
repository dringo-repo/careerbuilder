module Careerbuilder
  module Utils
    module Request
      extend self

      def get(params)
        # combine params into query string
        query = "token=#{Careerbuilder.configuration.api_token}&"
        params.each{|key,value| query << "#{key}=#{value}&"}

        # get call on REST API
        base_url = 'http://api.appcast.io/search?'
        response = HTTParty.get(base_url + query)

        # parse data
        data = JSON.parse(response.body, {symbolize_names: true})
      end
    end
  end
end
