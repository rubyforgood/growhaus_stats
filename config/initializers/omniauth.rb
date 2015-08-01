unless Rails.env.production?
  begin
    settings_path = File.expand_path('../../application.yml', __FILE__)
    settings      = YAML.load_file(settings_path)

    ENV['GOOGLE_CLIENT_ID']     ||= settings['GOOGLE_CLIENT_ID']
    ENV['GOOGLE_CLIENT_SECRET'] ||= settings['GOOGLE_CLIENT_SECRET']
  rescue Errno::ENOENT
    Rails.logger.warn 'Unable to find local application.yml file.  Skipping.'
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:developer) unless Rails.env.production?
  provider(:google_oauth2,
           ENV["GOOGLE_CLIENT_ID"],
           ENV["GOOGLE_CLIENT_SECRET"],
           scope: ['email', 'profile', 'drive.readonly', 'https://spreadsheets.google.com/feeds/'])
end

OmniAuth.config.logger = Rails.logger
