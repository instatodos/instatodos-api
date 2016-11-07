source "https://rubygems.org"

gem "rails", "5.0.0"
gem "puma"
gem "pg"
gem "active_model_serializers"
gem "redis", "~> 3.0"
gem "friendly_id"

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "rspec-rails", "3.5.1"
  gem "factory_girl_rails"
  gem "faker"
end

group :development do
  gem "listen", '~> 3.0.5'
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", '~> 2.0.0'
  gem "mina"
  gem "mina-puma", require: false
  gem "mina-nginx", require: false
end

group :test do
  gem "shoulda-matchers", "~> 3.1.1"
  gem "shoulda-context"
  gem "database_cleaner"
end

