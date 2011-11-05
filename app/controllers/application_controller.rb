class ApplicationController < ActionController::Base
  protect_from_forgery
  include PollsHelper
  include SessionsHelper
end
