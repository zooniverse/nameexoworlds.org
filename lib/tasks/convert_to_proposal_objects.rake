task :convert_to_proposal_objects => :environment do
  Proposal.transaction do
    Proposal.delete_all

    System.find_each do |system|
      system.proposed_names.find_each do |system_name_proposal|
        proposal = Proposal.create! club: system_name_proposal.club, system: system

        system_name_proposal.update_attributes! proposal: proposal
        system.planets.find_each do |planet|
          planet.proposed_names.where(club_id: proposal.club.id).update_all(proposal_id: proposal.id)
        end
      end
    end
  end
end
