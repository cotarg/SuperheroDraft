class AddMatchTitleAndStakesToMatchesModel < ActiveRecord::Migration
  def change
    add_column :matches, :name, :string
    add_column :matches, :stakes, :string
  end
end
