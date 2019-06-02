# frozen_string_literal: true

class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM scores;'
    add_reference :scores, :user, index: true
    change_column_null :scores, :user_id, false
  end

  def down
    remove_reference :scores, :user, index: true
  end
end
