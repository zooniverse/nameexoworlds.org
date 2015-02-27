class PlanetsController < ApplicationController
  before_action :authenticate_club!,  except: [:show]

  def add_club_name
    if @planet = Planet.find(params[:id]) and current_club
      @planet.proposed_names.create(name: params[:name], club: current_club)
      redirect_to @planet.system
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_club_name
    if @planet = Planet.find(params[:id]) and current_club
      @planet.proposed_names.find_by_club_id(current_club.id).destroy
      redirect_to @planet.system
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
