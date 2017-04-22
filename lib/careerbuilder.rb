require "careerbuilder/configuration"
require 'careerbuilder/errors/configuration'
require "careerbuilder/utils/request"
require "careerbuilder/version"
require "careerbuilder/job"

require "json"
require "httparty"

module Careerbuilder
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
