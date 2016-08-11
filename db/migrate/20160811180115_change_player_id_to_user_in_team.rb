class ChangePlayerIdToUserInTeam < ActiveRecord::Migration
  def change
    rename_column :teams, :player_id, :user_id
  end
end
