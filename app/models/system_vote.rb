class SystemVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :club

  after_create  :add_vote
  after_destroy :remove_vote

  def add_vote
    target.inc_vote_count
    user.inc_vote_count
  end

  def remove_vote
    target.dec_vote_count
    user.dec_vote_count
  end
end
