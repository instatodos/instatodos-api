ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'database_cleaner'
require 'simplecov'

SimpleCov.start 'rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run_when_matching :focus

  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.backtrace_exclusion_patterns << %r{/gems/}

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
