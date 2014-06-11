class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :proposed_name_id
      t.timestamps
    end
  end
end
