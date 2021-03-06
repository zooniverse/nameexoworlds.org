class ProposedName < ActiveRecord::Base
  belongs_to :club
  belongs_to :nameable_entity, polymorphic: true
  belongs_to :proposal
  has_many   :votes

  def self.for_system
    where(nameable_entity_type: 'System')
  end

  def self.for_planet
    where(nameable_entity_type: 'Planet')
  end

  # def inc_vote_count
  #   increment! :vote_count
  #   planet.inc_vote_count, self
  # end
  #
  # def dec_vote_count
  #   decrement! :vote_count
  #   planet.dec_vote_count, self
  # end

  def description
    super || ""
  end

  def add_vote_from_user(user)
    votes.create(user: user)
  end

  def remove_vote_from_user(user)
    votes.where(user_id: user.id).destroy
  end

  def no_votes
    votes.count
  end

  def system
    nameable_entity_type == 'System' ? nameable_entity : nameable_entity.system
  end
end
