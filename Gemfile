source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg'
gem 'puma'
gem 'active_model_serializers'
gem 'redis', '~> 3.0'
gem 'friendly_id'

gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5.x'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.1.0' # Needed by action cable
gem 'react-rails', '~> 1.6.1'
gem 'classnames-rails'
gem 'sass', '3.4.21'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'lodash-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-alt'
  gem 'rails-assets-axios'
  # gem 'rails-assets-react-bootstrap'
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails', '3.5.0.beta3'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'quiet_assets'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
  gem 'mina'
  gem 'mina-puma', :require => false
  gem 'mina-nginx', :require => false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'shoulda-context'
  gem 'database_cleaner'
  gem 'capybara', branch: :master
  gem 'poltergeist'
  gem "capybara-webkit"
  gem 'launchy'
end
