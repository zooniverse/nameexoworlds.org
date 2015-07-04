class AddSystemIdToProposalVotes < ActiveRecord::Migration
  def change
    add_column :proposal_votes, :system_id, :integer, null: false
    add_index :proposal_votes, [:system_id, :user_id], unique: true
  end
end
