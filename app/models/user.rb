class User < ActiveRecord::Base
  require 'securerandom'
  has_secure_password
  validates :provider, presence: true

  before_create do
    self.api_key = SecureRandom.hex
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
