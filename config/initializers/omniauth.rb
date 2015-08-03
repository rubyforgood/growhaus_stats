Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:developer) unless Rails.env.production?
  provider(:google_oauth2,
           Rails.application.secrets.google_client_id,
           Rails.application.secrets.google_client_secret,
           access_type: 'offline',
           prompt:      'consent',
           scope:       ['email', 'profile', 'drive.readonly', 'https://spreadsheets.google.com/feeds/'])
end

OmniAuth.config.logger = Rails.logger
