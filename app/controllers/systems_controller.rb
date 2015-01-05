class SystemsController < ApplicationController
  before_action :authenticate_club!,  except: [:show]

  protect_from_forgery :except => [:add_club_vote, :remove_club_vote]

  def add_club_vote
    if @system = System.find(params[:id]) and (current_club || Club.first)
      @system.vote_from_club(current_club || Club.first)
      render :json => {new_vote_count: @system.system_vote_count}.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_club_vote
    if @system = System.find(params[:id]) and (current_club || Club.first)
      @system.remove_vote_from_club(current_club || Club.first)
      render :json => {new_vote_count: @system.system_vote_count}.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def index
    @systems = System.all
  end

  def show
    @club = current_club 
    @system = System.find(params[:id])
  end

end
