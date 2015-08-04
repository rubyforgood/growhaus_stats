# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  image_url     :string
#  account_url   :string
#  provider      :string
#  token         :string
#  uid           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  role          :integer          default(0)
#  department_id :integer
#  refresh_token :string
#

class User < ActiveRecord::Base
  EXCEPTION_EMAILS = ['brice@optoro.com',
                      'brice84@gmail.com',
                      'i@austinwood.me',
                      'adunkman@gmail.com',
                      'bengmorris@gmail.com',
                      'riley@thegrowhaus.org',
                      'kmanuel09@gmail.com']

  validate :accepted_email
  belongs_to :department

  enum role: %w(default admin)

  def self.find_or_initialize_from_auth(data)
    user = find_or_initialize_by(provider: data.provider, uid: data.uid)

    user.name          = data.info.name
    user.email         = data.info.email
    user.image_url     = data.info.image
    user.account_url   = data.info.urls && data.info.urls.Google
    user.provider      = data.provider
    user.token         = data.credentials.token
    user.refresh_token = data.credentials.refresh_token
    user.uid           = data.uid

    user
  end

  def accepted_email
    if email !~ /\A([^@\s]+)@thegrowhaus.org\z/ && !EXCEPTION_EMAILS.include?(email)
      errors.add(:email, 'Invalid email.')
    end
  end

  def at_least_one_admin
    if User.where(role: 1).count < 1
      raise ActiveRecord::Rollback
    end
  end

  def drive_files(url = nil)
    with_google_drive do |session|
      files = session.files

      if url
        files.find { |f| /#{f.id}/ =~ url }
      else
        files
      end
    end
  end

  private

  def drive_session
    @drive_session ||= GoogleDrive.login_with_oauth(token)
  end

  def refresh_token!
    client             = Google::APIClient.new
    auth               = client.authorization
    auth.client_id     = Rails.application.secrets.google_client_id
    auth.client_secret = Rails.application.secrets.google_client_secret
    auth.scope         = GrowhausStats.settings.google_scopes
    auth.refresh_token = self.refresh_token

    auth.fetch_access_token!

    self.token = auth.access_token
    save!
  end

  def with_google_drive(attempts = 1)
    yield drive_session
  rescue Google::APIClient::AuthorizationError
    if attempts > 0
      refresh_token!
      reload
      attempts -= 1
      retry
    else
      raise
    end
  end
end
