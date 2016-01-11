require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AjaxMockServer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    #===>Load API Path
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    config.autoload_paths += Dir["#{config.root}/lib", "#{config.root}/lib/**/"]
    # Enable the asset pipeline
    # config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "font", "material-design-icons")
    config.assets.paths << Rails.root.join("app", "assets", "font", "roboto")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    #<===
    config.i18n.default_locale = :zh
    config.time_zone = 'Beijing'
    config.encoding = "utf-8"
    config.generators do |g|
        g.assets false
        g.helper false
        g.javascripts false
        g.stylesheets false
        #g.orm :active_record
        #g.template_engine :erb
        #g.test_framework false
        g.test_framework :rspec,
            fixtures: true,
            view_specs: false,
            helper_specs: false,
            routing_specs: false,
            controller_specs: true,
            request_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
