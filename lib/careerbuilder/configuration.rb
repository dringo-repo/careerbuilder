module Careerbuilder
  class Configuration
    attr_accessor :api_token

    def initialize
      @api_token = nil
    end

    def api_token
      raise Errors::Configuration, "Careerbuilder API token missing! See the documentation for configuration settings." unless @api_token
      @api_token
    end
  end
end
