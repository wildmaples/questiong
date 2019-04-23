class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :name
      t.string :website
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
