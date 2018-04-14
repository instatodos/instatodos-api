source 'https://rubygems.org'
ruby '2.5.1'

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'friendly_id'
gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '5.2.0'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
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
  gem 'shoulda-context'
  gem 'shoulda-matchers', '~> 3.1.1'
end
