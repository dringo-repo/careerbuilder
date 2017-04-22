require 'bundler/setup'
require 'careerbuilder'

RSpec.configure do |config|
  config.order = 'random'
  config.before(:all) do
    Careerbuilder.configure do |config|
      config.api_token = ENV['CB_TOKEN']
    end
  end
end
