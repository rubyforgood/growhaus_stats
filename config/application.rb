require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# If a local config/application.yml file is available, use it to
# set environment variables on startup that can be used in places like
# secrets.yml. Prefer pre-set env variables if they already exist.
begin
  file_path = File.expand_path('../application.yml', __FILE__)
  settings  = YAML.load_file(file_path)

  settings.each do |key, value|
    ENV[key.upcase] ||= value
  end
rescue Errno::ENOENT
  Rails.logger.warn 'Unable to find local application.yml file.  Skipping.'
end

module GrowhausStats
  def self.settings
    return @settings if @settings

    new_settings  = ActiveSupport::OrderedOptions.new
    file_path     = File.expand_path('../settings.yml', __FILE__)
    yaml          = YAML.load_file(file_path)

    new_settings.merge!(yaml.symbolize_keys)

    @settings = new_settings
  end

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

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
    html_tag
    }
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
