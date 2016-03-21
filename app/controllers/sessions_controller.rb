class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # omniauth stores data in the request.env instead of params
    auth = request.env["omniauth.auth"]
    # even though this is a login action, an OAuth login can be a login *or* a registration
    #
    # if the user exists, log her in
    # if the user doesn't exist, create her, then log her in

    # user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to root_url, notice: "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
