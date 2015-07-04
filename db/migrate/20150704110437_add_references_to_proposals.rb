class AddReferencesToProposals < ActiveRecord::Migration
  def change
    add_column :proposed_names, :proposal_id, :integer
  end
end
