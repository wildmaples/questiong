# frozen_string_literal: true

class AddUserIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user_id, :integer
  end
end
