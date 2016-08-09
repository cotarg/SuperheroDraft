class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :host_id
      t.integer :player_one
      t.integer :player_two
      t.integer :player_three
      t.integer :player_four
      

      t.timestamps null: false
    end
  end
end
