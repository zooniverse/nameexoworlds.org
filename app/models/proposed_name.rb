class ProposedName < ActiveRecord::Base
    belongs_to :proposing_organisation
    belongs_to :planet
    has_many   :votes

    def inc_vote_count
      increment! :vote_count
      planet.inc_vote_count, self
    end

    def dec_vote_count
      decrement! :vote_count
      planet.dec_vote_count, self
    end
end
