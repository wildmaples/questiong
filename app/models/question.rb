# frozen_string_literal: true

class Question < ActiveRecord::Base
  has_many :answer
  belongs_to :user
  validates :question, presence: true, length: { minimum: 10, maximum: 300 }
  validates :name, presence: true, length: { minimum: 3, maximum: 45 }
  # To do: Add validation for website
  # with gem https://github.com/perfectline/validates_url

  validates :user_id, presence: true
end
