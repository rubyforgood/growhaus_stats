class User < ActiveRecord::Base
  validate :email_format

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.name = data.info.name
    user.email = data.info.email
    user.image_url = data.info.image
    user.account_url = data.info.urls.Google
    user.provider = data.provider
    user.token = data.credentials.token
    user.uid = data.uid
    user.save

    user
  end

  def email_format
    if email !~ /\A([^@\s]+)@thegrowhaus.org\z/ && !authorized_emails.include?(email)
      errors.add(:email, "Please sign in with your Growhaus email")
    end
  end

  private

  def authorized_emails
    ["i@austinwood.me", "brice@optoro.com"]
  end
end
