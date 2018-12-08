require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rent
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sucker_punch

    config.assets.enabled = true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)$/
    config.i18n.default_locale = :ru

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
