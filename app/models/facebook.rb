require 'open-uri'

class Facebook
  # Use token to get profile information from Facebook
  # from the user who owns that token.
  def self.profile(token)
    # Once you have an access token, getting data from the API is easy.
    # Just attach the token to any API request URL.
    url = 'https://graph.facebook.com/me'
    url += '?access_token=' + token
    open(URI::encode(url)).read
  end
end
