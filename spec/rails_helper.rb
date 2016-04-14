ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rspec"
require "capybara/poltergeist"
require "capybara/webkit"
require "shoulda/matchers"
require "database_cleaner"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: true,
    inspector: false,
    debug: false,
    phantomjs_options: [
      "--proxy-type=none",
      "--load-images=no",
      "--ignore-ssl-errors=yes",
      "--ssl-protocol=any",
      "--web-security=false"
    ]
  }
  Capybara::Poltergeist::Driver.new app, options
end

Capybara::Webkit.configure(&:allow_unknown_urls)

Capybara.javascript_driver = :poltergeist

Capybara.server do |app, port|
  require "puma"
  Puma::Server.new(app).tap do |s|
    s.add_tcp_listener Capybara.server_host, port
  end.run.join
end

# Capybara.server = :puma

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.backtrace_exclusion_patterns << %r{/gems/}

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs =
      Capybara.current_driver == :rack_test

    unless driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
