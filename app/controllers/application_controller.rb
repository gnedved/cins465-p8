class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Only want this if we require authentication before page can be accessed
  # before_filter :authenticate_user!
end
