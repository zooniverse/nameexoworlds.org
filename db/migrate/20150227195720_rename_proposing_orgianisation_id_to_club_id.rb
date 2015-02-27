class RenameProposingOrgianisationIdToClubId < ActiveRecord::Migration
  def change
    rename_column :proposed_names , :proposing_organisation_id, :club_id
  end
end
