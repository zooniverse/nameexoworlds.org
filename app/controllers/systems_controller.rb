class SystemsController < ApplicationController
  caches_page :index

  protect_from_forgery :except => [:add_club_vote, :remove_club_vote]

  def index
    redirect_to '/the_exoworlds'
  end

  def show
    @system = System.includes(:proposals => [:proposed_system_name, :proposed_planet_names]).find(params[:id])
    @proposals = @system.proposals.sort_by {|i| rand }
    @proposal_vote = current_user.proposal_votes.where(system: @system).first if current_user
  end
end
