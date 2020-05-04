# frozen_string_literal: true

class AddStayAnonymousDefaultValue < ActiveRecord::Migration[5.2]
  def change
    # Make sure no null value exist
    Question.where(stay_anonymous: nil).update_all(stay_anonymous: false)
    change_column(:questions, :stay_anonymous, :boolean, default: false)
    change_column(:answers, :stay_anonymous, :boolean, default: false)
  end
end
