source "https://rubygems.org"

gem "rails", "5.1.1"
gem 'bootsnap', require: false
gem "puma"
gem "pg"
gem "redis", "~> 3.0"
gem 'rack-cors', require: 'rack/cors'
gem "active_model_serializers"
gem "friendly_id"

group :development, :test do
  gem "pry"
  gem "pry-nav"
  gem "pry-byebug"
  gem "rspec-rails", "~> 3.6.0"
  gem "factory_girl_rails"
  gem "faker"
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"

  # Deployment
  gem "mina"
  gem "mina-puma", require: false
  gem "mina-nginx", require: false
end

group :test do
  gem "shoulda-matchers", "~> 3.1.1"
  gem "shoulda-context"
  gem "database_cleaner"
end
