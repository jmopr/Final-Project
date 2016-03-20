class User < ActiveRecord::Base
  require 'securerandom'
  has_secure_password

  before_create do
    self.api_key = SecureRandom.hex
  end
end
