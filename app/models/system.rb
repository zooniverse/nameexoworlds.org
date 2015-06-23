class System < ActiveRecord::Base
  has_many :planets
  has_many :system_votes
  has_many :remarks
  has_many :proposed_names, as: :nameable_entity



  end
  def vote_from_club(club)
    system_votes.create(club: club) unless has_club_vote(club) or club.has_reached_vote_limit?
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

  def has_name_from(club)
    proposed_names.find_by_club_id(club.id)
  end

  def nameable_planets
    return planets.where({nameable: true}).count
  end

  def remarks_for_club(club)
    remarks.find_by_club_id(club.id)
  end

  def remove_club_suggestion(club)
    proposed_names.find_by_club_id(club.id).destroy
    planets.each{|p| p.proposed_names.find_by_club_id(club.id).destroy}
    remarks.find_by_club_id(club.id).destroy
  end
end
