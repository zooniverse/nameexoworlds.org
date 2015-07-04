class ProposalVote < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user
  belongs_to :system # Associated directly to allow database to easily enforce voting once per user per system
end
