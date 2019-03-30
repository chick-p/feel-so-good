class AddTwitterAuthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :t_username, :string
    add_index :users, [:provider, :uid], unique: true
  end
end
