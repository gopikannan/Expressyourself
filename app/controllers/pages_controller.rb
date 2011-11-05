class PagesController < ApplicationController
  def home
          @poll = Poll.new
          @poll_items = Poll.all
  end

  def login
          auth = request.env["omniauth.auth"]
          user = User.find_by_fb_id(auth["uid"]) || User.create_with_omniauth(auth)
          session[:user_id] = user.id
          redirect_to root_path
  end
end
