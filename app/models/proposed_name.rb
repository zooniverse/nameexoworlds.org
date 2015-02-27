class ProposedName < ActiveRecord::Base
    belongs_to :club
    belongs_to :nameable_entity, polymorphic: true
    has_many   :votes

    # def inc_vote_count
    #   increment! :vote_count
    #   planet.inc_vote_count, self
    # end
    #
    # def dec_vote_count
    #   decrement! :vote_count
    #   planet.dec_vote_count, self
    # end

    def system
      nameable_entity_type == 'System' ? nameable_entity : nameable_entity.system
    end
end
