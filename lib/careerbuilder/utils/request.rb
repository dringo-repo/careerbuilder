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
        begin
          data = JSON.parse(response.body, {symbolize_names: true})
        rescue JSON::ParserError
          data = {error: "Careerbuilder Error"}
        end
      end
    end
  end
end
