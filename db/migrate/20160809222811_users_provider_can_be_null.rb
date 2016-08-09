class UsersProviderCanBeNull < ActiveRecord::Migration
  def change
    change_column :users, :provider, :string, :null => true
    change_column :users, :uid, :string, :null => true
    change_column :users, :name, :string, :null => true
  end
end
