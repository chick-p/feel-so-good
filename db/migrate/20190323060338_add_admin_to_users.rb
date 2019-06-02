# frozen_string_literal: true

class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    change_column_null :users, :admin, false
  end
end
