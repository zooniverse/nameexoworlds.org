class CreateProposalVotes < ActiveRecord::Migration
  def change
    create_table :proposal_votes do |t|
      t.references :proposal, null: false
      t.references :user, null: false
    end

    add_index :proposal_votes, [:proposal_id, :user_id], unique: true
  end
end
