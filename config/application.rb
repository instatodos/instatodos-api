require File.expand_path('../boot', __FILE__)

require "rails"

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "action_cable/engine"
# require "active_job/railtie"
# require "action_mailer/railtie"

Bundler.require(*Rails.groups)

module InstaTodo
  class Application < Rails::Application
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper = false
  end
end
