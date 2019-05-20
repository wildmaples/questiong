# frozen_string_literal: true

require 'logger'
class ApplicationController < ActionController::Base

  # To prevent CSRF attacks
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end 
  end

  # Meow logs error with emojis cause why not
  def meow(error)
    logger = Logger.new('QuestiongLog.log')

    if error
      logger.error('🚧 Error: ' + error + ' 🚧')
    else
      logger.error('🚧 Error occurred!! 🚧')
    end
  end
end