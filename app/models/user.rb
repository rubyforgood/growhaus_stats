# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  image_url   :string
#  account_url :string
#  provider    :string
#  token       :string
#  uid         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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

    user.name        = data.info.name
    user.email       = data.info.email
    user.image_url   = data.info.image
    user.account_url = data.info.urls && data.info.urls.Google
    user.provider    = data.provider
    user.token       = data.credentials.token
    user.uid         = data.uid

    user
  end

  def accepted_email
    if email !~ /\A([^@\s]+)@thegrowhaus.org\z/ && !EXCEPTION_EMAILS.include?(email)
      errors.add(:email, 'Invalid email.')
    end
  end

  def drive_files(url = nil)
    files = drive_session.files

    if id
      files.find { |f| /#{f.id}/ =~ url }
    else
      files
    end
  end

  private

  def drive_session
    @drive_session ||= GoogleDrive.login_with_oauth(token)
  end
end
