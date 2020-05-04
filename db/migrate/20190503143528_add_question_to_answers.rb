# frozen_string_literal: true

class AddQuestionToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference(:answers, :question, foreign_key: true)
  end
end
