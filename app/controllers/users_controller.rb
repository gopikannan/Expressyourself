class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @user_polls = @user.polls.all
  end

end
