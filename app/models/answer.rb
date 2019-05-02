# frozen_string_literal: true

class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, presence: :true, length: { minimum: 3, maximum: 300 }
  validates :name, presence: :true, length: { minimum: 3, maximum: 45 }
  # To do: Add validation for website
  # with gem https://github.com/perfectline/validates_url
end