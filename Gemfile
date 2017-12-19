source 'https://rubygems.org'
ruby '2.4.1'

gem 'active_model_serializers'
gem 'bootsnap', require: false
gem 'friendly_id'
gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '5.1.2'
gem 'redis', '~> 3.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-nav'
  gem 'rspec-rails', '~> 3.7.0'

  # code analysis
  gem 'brakeman',      require: false
  gem 'bullet',        require: false
  gem 'reek',          require: false
  gem 'rubocop',       require: false
  gem 'rubocop-rspec', require: false
  gem 'rubycritic',    require: false
  gem 'simplecov',     require: false
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'

  # Deployment
  gem 'mina'
  gem 'mina-nginx', require: false
  gem 'mina-puma', require: false
end

group :test do
  gem 'action-cable-testing'
  gem 'database_cleaner'
  gem 'shoulda-context'
  gem 'shoulda-matchers', '~> 3.1.1'
end
