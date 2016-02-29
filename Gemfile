
source 'https://rubygems.org'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'sqlite3'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'active_model_serializers'
gem 'react-rails', '~> 1.6.1'
gem 'sprockets-es6'
gem 'coffee-rails', '~> 4.1.0' # Needed by action cable
gem 'turbolinks', '~> 5.x'
gem 'redis', '~> 3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-alt'
  gem 'rails-assets-axios'
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'quiet_assets'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
  gem 'rubocop'
end

group :test do
  gem 'shoulda-matchers', '2.8.0'
  gem 'shoulda-context'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
  gem 'rails-controller-testing'
end
