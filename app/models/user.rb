class User < ActiveRecord::Base
  EXCEPTION_EMAILS = ['brice@optoro.com',
                      'i@austinwood.me',
                      'adunkman@gmail.com',
                      'bengmorris@gmail.com',
                      'riley@thegrowhaus.org',
                      'kmanuel09@gmail.com']

  validate :accepted_email

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
end
