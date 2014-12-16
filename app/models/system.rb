class System < ActiveRecord::Base
  has_many :planets
  has_many :system_votes

  def vote_from_club(club)
    system_votes.create(club: club) unless has_club_vote(club)
  end

  def remove_vote_from_club(club)
    system_votes.find_by_club_id(club.id).destroy
  end

  def has_club_vote(club)
    system_votes.find_by_club_id(club.id)
  end

  def system_vote_count
    system_votes.count
  end
end
