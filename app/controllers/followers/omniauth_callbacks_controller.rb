class Followers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @follower = Follower.find_for_facebook_oauth(env["omniauth.auth"])  

    if @follower.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @follower, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_follower_registration_url
    end
  end
  
  def google_oauth2
      @follower = Follower.find_for_google_oauth2(request.env["omniauth.auth"], current_follower)

      if @follower.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @follower, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_follower_registration_url
      end
  end
end
