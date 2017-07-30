source 'https://rubygems.org'

gem 'rails', '5.1.2'
gem 'bootsnap', require: false
gem 'puma'
gem 'pg'
gem 'redis', "~> 3.0"
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'
gem 'friendly_id'

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'factory_girl_rails'
  gem 'faker'

  # code analysis
  gem 'snip_snip',  github: 'kddeisz/snip_snip'
  gem 'bullet',     require: false
  gem 'brakeman',   require: false
  gem 'rubocop',    require: false
  gem 'rubycritic', require: false
  gem 'simplecov',  require: false
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'

  # Deployment
  gem 'mina'
  gem 'mina-nginx', require: false
  gem 'mina-puma',  require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'shoulda-context'
  gem 'database_cleaner'
end
