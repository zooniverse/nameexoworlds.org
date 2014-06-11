class Planet < ActiveRecord::Base
  has_many    :proposed_names
  belongs_to  :system

  def inc_vote_count(vote)
    increment :total_votes
    update_top_vote name
  end

  def dec_vote_count(vote)
    decrement :total_votes
  end

  def update_top_vote(vote)
    if name.vote_count > top_vote
      top_vote      = name.vote_count
      top_vote_name = name.name
    end
  end
end
