# frozen_string_literal: true

class AddAnonymousCheck < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :stay_anonymous, :boolean
  end
end
