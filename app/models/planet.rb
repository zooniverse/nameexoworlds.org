class Planet < ActiveRecord::Base
  has_many    :proposed_names
  belongs_to  :system
  has_many    :proposed_names, as: :nameable_entity

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

  def has_name_from(club)
    proposed_names.find_by_club_id(club.id)
  end
end
