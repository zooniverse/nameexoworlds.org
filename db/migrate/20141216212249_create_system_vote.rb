class CreateSystemVote < ActiveRecord::Migration
  def change
    create_table :system_votes do |t|
      t.integer :club_id
      t.integer :system_id
    end
  end
end
