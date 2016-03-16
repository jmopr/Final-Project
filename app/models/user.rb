class User < ActiveRecord::Base
  require 'securerandom'
  before_create do
    self.api_key = SecureRandom.hex
  end
  has_secure_password
end
