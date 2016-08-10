class AddNameToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :name, :string, null: true
  end
end
