class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :team_id # the team being upvoted
      t.integer :user_id # the user making the upvote

      t.timestamps null: false
    end
  end
end
