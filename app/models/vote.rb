class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposed_name

  after_create  :add_vote
  after_destroy :remove_vote

  validates_uniqueness_of :user_id, :scope => :proposed_name_id

  def add_vote
    proposed_name.planet.inc_vote_count
    user.inc_vote_count
  end

  def remove_vote
    proposed_name.planet.dec_vote_count
    user.dec_vote_count
  end
end
