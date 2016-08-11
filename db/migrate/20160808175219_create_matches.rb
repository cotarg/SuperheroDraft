class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :host_id # number 1-4 which says which player it is.
      t.integer :player_one
      t.integer :player_two
      t.integer :player_three
      t.integer :player_four
      

      t.timestamps null: false
    end
  end
end
