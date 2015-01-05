class AddCanVoteToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :can_vote, :boolean
  end
end
