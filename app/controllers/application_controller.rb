class ApplicationController < ActionController::Base
    helper_method :current_user
    protect_from_forgery with: :exception
    # what does that mean 

  def current_user
    user_id = session[:user_id]
    user_id && User.find(user_id)
  end 
end
