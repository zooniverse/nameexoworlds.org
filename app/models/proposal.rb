class Proposal < ActiveRecord::Base
  belongs_to :club
  belongs_to :system

  has_one  :proposed_system_name, -> { for_system }, class_name: "ProposedName", foreign_key: 'proposal_id'
  has_many :proposed_planet_names, -> { for_planet }, class_name: "ProposedName", foreign_key: 'proposal_id'

  # def system_proposal
  #   system.proposed_names.find {|name| name.club_id == club.id }
  # end

  # def planet_proposals
  #   system.planets.map do |planet|
  #     [planet, planet.proposed_names.find {|name| name.club_id == club.id }]
  #   end.to_h
  # end

  # def planet_proposal(planet)
  #   planet_proposals[planet]
  # end
end

