class SystemsController < ApplicationController
  before_action :authenticate_club! except:[:show]

  protect_from_forgery :except => [:add_club_vote, :remove_club_vote]

  def add_club_vote
    if @system = System.find(params[:id]) and (current_club || Club.first)
      @system.vote_from_club(current_club || Club.first)
      render :nothing => true
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_club_vote
    if @system = System.find(params[:id]) and (current_club || Club.first)
      @system.remove_vote_from_club(current_club || Club.first)
      render :nothing => true
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def index
  
  end

  def show
    @club = current_club || Club.first
    @system = System.find(params[:id])
  end

end
