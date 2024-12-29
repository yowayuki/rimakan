require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    # set timezone
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    # set locale
    config.i18n.default_locale = :ja
    config.i18n.available_locales = [:en, :ja]

    config.api_only = true

    config.hosts << '.example.com'
  end
end
