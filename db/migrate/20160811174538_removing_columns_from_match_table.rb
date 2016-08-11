class RemovingColumnsFromMatchTable < ActiveRecord::Migration
  def change
    remove_column :matches, :player_one, :integer
    remove_column :matches, :player_two, :integer
    remove_column :matches, :player_three, :integer
    remove_column :matches, :player_four, :integer
    remove_column :matches, :host_id, :integer
  end
end
