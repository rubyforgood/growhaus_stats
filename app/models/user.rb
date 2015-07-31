class User < ActiveRecord::Base
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
end
