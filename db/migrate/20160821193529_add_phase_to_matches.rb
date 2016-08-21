class AddPhaseToMatches < ActiveRecord::Migration
  def change
    # 1 = still accepting/assembling teams, 2 = voting phase, 3 = closed.
    add_column :matches, :phase, :integer
  end
end
