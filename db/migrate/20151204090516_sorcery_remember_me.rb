class SorceryRememberMe < ActiveRecord::Migration
  def change
    add_column :users, :remember_me_token, :string, :default => nil
    add_column :users, :remember_me_token_expires_at, :datetime, :default => nil

    add_column :users, :name, :string, :null =>false

    add_column :users, :address, :string
    add_column :users, :phone, :integer
    # add_column :users, :role, :references, :foreign_key => true

    add_index :users, :remember_me_token
    add_foreign_key :users, :roles
  end
end