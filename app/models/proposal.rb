class Proposal < ActiveRecord::Base
  belongs_to :club
  belongs_to :system

  has_one  :proposed_system_name, -> { for_system }, class_name: "ProposedName", foreign_key: 'proposal_id'
  has_many :proposed_planet_names, -> { for_planet }, class_name: "ProposedName", foreign_key: 'proposal_id'

  has_many :proposal_votes

  def add_vote_from(user)
    proposal_votes.where(user: user, system: system).first_or_create!
  end
end

