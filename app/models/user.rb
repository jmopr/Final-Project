class User < ActiveRecord::Base
  require 'securerandom'
  has_secure_password
  
  before_create do
    self.api_key = SecureRandom.hex
  end

  def token
    render plain: Facebook.profile(params[:token])
  end
end
