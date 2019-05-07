# frozen_string_literal: true

require 'logger'
class ApplicationController < ActionController::Base

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
