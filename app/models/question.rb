# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :question, presence: :true, length: { minimum: 10, maximum: 300 }
  validates :name, presence: :true, length: { minimum: 3, maximum: 45 }
  # To do: Add validation for website
  # with gem https://github.com/perfectline/validates_url
end
