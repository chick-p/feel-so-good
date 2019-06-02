# frozen_string_literal: true

class AddAuthTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
  end
end
