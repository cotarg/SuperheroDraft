class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :player_id
      
      t.string :hero_one
      t.string :hero_two
      t.string :hero_three
      t.string :hero_four
      t.string :hero_five
      t.string :hero_six

      t.string :villain_one
      t.string :villain_two
      t.string :villain_three
      t.string :villain_four

      t.string :cover_url
      t.text :pitch

      t.timestamps null: false
    end
  end
end
