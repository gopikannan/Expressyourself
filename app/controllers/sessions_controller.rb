class SessionsController < ApplicationController
  def new
          auth = request.env["omniauth.auth"]
          user = User.find_by_fb_id(auth["uid"]) || User.create_with_omniauth(auth)
          sign_in user
          redirect_to root_path
  end
end
