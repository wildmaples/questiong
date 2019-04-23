class AddAnonymousCheck < ActiveRecord::Migration[5.2]
  def change
    add_column :question, :stay_anonymous, :boolean
  end
end
