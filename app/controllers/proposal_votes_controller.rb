class ProposalVotesController < ApplicationController
  before_action :authenticate_user!

  def create
    proposal = Proposal.find params[:proposal_id]
    proposal.add_vote_from(current_user)
    redirect_to proposal.system
  end
end
