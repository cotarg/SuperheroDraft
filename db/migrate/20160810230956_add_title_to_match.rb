class AddTitleToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :user, :string, null: true
  end
end
