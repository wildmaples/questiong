# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :answer
      t.string :name
      t.string :website
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :stay_anonymous
    end
  end
end
