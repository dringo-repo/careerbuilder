require "bundler/setup"
require "careerbuilder"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.confiure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :web_mock
  config.default_cassette_options = { record: :once }
end
