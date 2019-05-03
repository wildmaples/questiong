# frozen_string_literal: true
require 'logger'
class ApplicationController < ActionController::Base
  def initialize
    logger = Logger.new('QuestiongLog.log')
  end

  # Meow logs error with emojis cause why not
  def meow(error)
    if error
      logger.error("🚧 Error: " + error + " 🚧")
    else 
      logger.error("🚧 Error occurred!! 🚧")
    end
  end
end